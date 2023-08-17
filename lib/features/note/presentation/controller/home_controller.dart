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
  bool loading = false;
  String currentDate = '';
  bool darkMode = false;
  bool englishLanguage = false;
  bool favourites = false;
  bool hidden = false;
  bool trash = false;
  int? nodeId;

  String? imageNote(String? image) {
    if (image != null && image != '') {
      File file = File(image);
      return file.path;
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentDate();
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

  Future<void> backToHomeScreen() async {
    Get.back();
    contentController.text = '';
    titleController.text = '';
    favourites = false;
    hidden = false;
    trash = false;
    saveImage = null;
    file = null;
    currentDate = '';
    update();
  }

  Future<void> _readAllNote() async {
    loading = true;
    _allNotes = await _noteDatabase.read();
    searchNotes = _allNotes;
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
      note.image = saveImage != null ? saveImage!.path : '';
      note.maxLinesOfContentNote = saveImage != null ? 5 : 10;
      note.date = _getCurrentDate();
      note.time = _getCurrentTime();
      int newRowId = await _noteDatabase.create(note);
      if (newRowId != 0) {
        nodeId = newRowId;
        note.id = newRowId;
        _allNotes.add(note);
        backToHomeScreen();
      }
    } else {
      showSnackBar(
        ManagerStrings.pleaseWriteAnything,
      );
    }
    update();
  }

  final DateTime _dateTime = DateTime.now();

  void getCurrentDate() {
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

  Future<void> updateNote(int id) async {
    NoteModel note = NoteModel();
    note.id = id;
    note.favourites = favourites == true ? 1 : 0;
    note.hidden = hidden == true ? 1 : 0;
    note.title = titleController.text;
    note.content = contentController.text;
    note.date = _getCurrentDate();
    note.time = _getCurrentTime();

    bool updated = await _noteDatabase.update(note);
    if (updated) {
      showSnackBar(ManagerStrings.updatedSuccessfully);
      loading = true;
      await _readAllNote();
      loading = false;
      await Get.offNamed(Routes.homeScreen);
    }
    update();
  }

  Future<void> deleteNote(int id) async {
    bool deleted = await _noteDatabase.delete(id);
    if (deleted) {
      //_notes.remove(element)
    }
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

  //////////////////////////////////////////////////////////////////////
  File? file;
  File? saveImage;

  void image() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
    );
    if (imageFile != null) {
      file = File(imageFile.path);
    }
    Directory directory = await getApplicationDocumentsDirectory();
    final fileName = basename(imageFile!.path);
    saveImage = await file!.copy('${directory.path}/$fileName');
    update();
  }

//////////////////////////////////////////////////////////////////////
}
