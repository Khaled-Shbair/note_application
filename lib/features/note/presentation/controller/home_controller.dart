import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '/config/all_imports.dart';

class HomeController extends GetxController with Helper {
  static HomeController get to => Get.find();

  late final NoteDatabaseController _noteDatabase = NoteDatabaseController();

  late TextEditingController contentController;
  late TextEditingController titleController;
  late TextEditingController searchController;
  List<NoteModel> _allNotes = <NoteModel>[];
  List<NoteModel> searchNotes = <NoteModel>[];
  List<NoteModel> favouritesNotes = <NoteModel>[];
  List<NoteModel> hiddenNotes = <NoteModel>[];
  List<NoteModel> trashNotes = <NoteModel>[];
  List<NoteModel> recentNotes = <NoteModel>[];

  bool loading = false;
  String currentDate = '';
  bool favourites = false;
  bool hidden = false;
  bool trash = false;
  File file = File('');
  File saveImage = File('');
  bool longPress = false;

  @override
  void onInit() {
    super.onInit();
    _getDate();
    _readAllNote();
    contentController = TextEditingController();
    searchController = TextEditingController();
    titleController = TextEditingController();
  }

  @override
  void onClose() {
    contentController.dispose();
    searchController.dispose();
    titleController.dispose();
    super.onClose();
  }

  void changeLongPress() {
    longPress = !longPress;
    update();
  }

  Future<void> backToHomeScreen() async {
    Get.back();
    contentController.text = '';
    titleController.text = '';
    favourites = false;
    hidden = false;
    trash = false;
    saveImage = File('');
    file = File('');
    currentDate = '';
    favouritesNotes.clear();
    trashNotes.clear();
    hiddenNotes.clear();
    _getDate();
    update();
  }

  Future<void> _readAllNote() async {
    _allNotes = [];
    loading = true;
    _allNotes = await _noteDatabase.read();
    _allNotes = _allNotes.reversed.toList();
    recentNote();
    searchNotes =
        _allNotes.where((note) => note.trash != 1 && note.hidden != 1).toList();
    loading = false;
    update();
  }

  Future<void> createNote() async {
    if (titleController.text.isNotEmpty) {
      NoteModel note = NoteModel();
      note.favourites = favourites == true ? 1 : 0;
      note.hidden = hidden == true ? 1 : 0;
      note.trash = trash == true ? 1 : 0;
      note.content = contentController.text;
      note.title = titleController.text;
      note.image = saveImage.path == '' ? saveImage.path : '';
      note.maxLinesOfContentNote = saveImage.path == '' ? 5 : 10;
      note.date = _getCurrentDate();
      note.time = _getCurrentTime();
      int newRowId = await _noteDatabase.create(note);
      if (newRowId != 0) {
        note.id = newRowId;
        _readAllNote().then((value) => backToHomeScreen());
      }
    } else {
      showSnackBar(
        ManagerStrings.pleaseWriteAnything,
      );
    }
    update();
  }

  final DateTime _dateTime = DateTime.now();

  void _getDate() {
    currentDate = '${_dateTime.day.toString().padLeft(2, '0')} '
        '${DateFormat.MMMM().format(_dateTime)}, '
        '${_dateTime.year}';
    update();
  }

  String _getCurrentDate() {
    String convertedDateToString = '${_dateTime.year}-'
        '${_dateTime.month.toString().padLeft(2, '0')}-'
        '${_dateTime.day.toString().padLeft(2, '0')} ';
    return convertedDateToString;
  }

  String _getCurrentTime() {
    String convertedTimeToString =
        '${_dateTime.hour.toString().padLeft(2, '0')}:'
        '${_dateTime.minute.toString().padLeft(2, '0')}:'
        '${_dateTime.second.toString().padLeft(2, '0')}';
    return convertedTimeToString;
  }

  int _changeBoolToInt(bool value) => value == true ? 1 : 0;

  bool changeIntToBool(int value) => value == 1 ? true : false;

  Future<void> updateNote(int id) async {
    NoteModel note = NoteModel();
    note.id = id;
    note.favourites = _changeBoolToInt(favourites);
    note.hidden = _changeBoolToInt(hidden);
    note.trash = _changeBoolToInt(trash);
    note.title = titleController.text;
    note.content = contentController.text;
    note.date = _getCurrentDate();
    note.time = _getCurrentTime();
    note.image = saveImage.path != '' ? saveImage.path : '';
    note.maxLinesOfContentNote = saveImage.path != '' ? 5 : 10;

    bool updated = await _noteDatabase.update(note);
    if (updated) {
      await _readAllNote();
      backToHomeScreen();
    }
    update();
  }

  Future<void> deleteNote(int id) async {
    bool deleted = await _noteDatabase.delete(id);
    if (deleted) {
      searchNotes.removeWhere(
        (note) {
          if (note.id == id) {
            trashNotes.add(note);
            return true;
          } else {
            return false;
          }
        },
      );
    }
    update();
  }

  void searchNote(String text) {
    if (text.isEmpty) {
      searchNotes = _allNotes;
    } else {
      searchNotes = _allNotes
          .where((note) => note.content
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    }
    update();
  }

  void recentNote() {
    recentNotes = [];
    loading = true;
    for (int i = 0; i <= _allNotes.length; i++) {
      if (i < 10 && i < _allNotes.length) {
        recentNotes.add(_allNotes[i]);
        update();
      } else {
        break;
      }
    }
    loading = false;
    update();
  }

  void favouriteNote() {
    favouritesNotes = [];
    loading = true;
    favouritesNotes = _allNotes.where((note) => note.favourites == 1).toList();
    loading = false;
  }

  void trashNote() {
    trashNotes = [];
    loading = true;
    trashNotes = _allNotes.where((note) => note.trash == 1).toList();
    loading = false;
  }

  void hiddenNote() {
    trashNotes = [];
    loading = true;
    hiddenNotes = _allNotes.where((note) => note.hidden == 1).toList();
    loading = false;
  }

  void changeFavourite() {
    favourites = !favourites;
    update();
  }

  void openCamera() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 2000,
      maxWidth: double.infinity,
      imageQuality: 100,
    );
    if (imageFile != null) {
      file = File(imageFile.path);
    }
    Directory directory = await getApplicationDocumentsDirectory();
    final fileName = basename(imageFile!.path);
    saveImage = await file.copy('${directory.path}/$fileName');
    update();
  }

  Future<void> edit(
      String title, String content, String image, int favourite) async {
    if (titleController.text.isEmpty &&
        contentController.text.isEmpty &&
        saveImage.path.isEmpty) {
      titleController.text = title;
      contentController.text = content;
      favourites = changeIntToBool(favourite);
      saveImage = File(image);
    }
  }
}
