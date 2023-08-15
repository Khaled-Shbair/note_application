import 'package:intl/intl.dart';

import '../../../../core/helper/helper.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/storage/database/controller/note_database_controller.dart';
import '../../../../routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/note_model.dart';
import 'image_controller.dart';

class HomeController extends GetxController with Helper {
  static HomeController get to => Get.find();

  late final NoteDatabaseController _noteDatabase = NoteDatabaseController();
  late final ImageController imageController = ImageController();
  late TextEditingController contentController;
  late TextEditingController titleController;
  late TextEditingController searchController;
  List<NoteModel> _allNotes = <NoteModel>[];
  List<NoteModel> _searchNotes = <NoteModel>[];
  bool loading = false;
  String currentDate = '';
  bool darkMode = false;
  bool englishLanguage = false;
  bool favourites = false;
  bool hidden = false;

  List<NoteModel> get searchNotes => _searchNotes;

  @override
  void onInit() {
    super.onInit();
    _readAllNote();
    imageController.readAllImages();
    contentController = TextEditingController();
    searchController = TextEditingController();
    titleController = TextEditingController();
    getCurrentDate();
  }

  @override
  void onClose() {
    contentController.dispose();
    searchController.dispose();
    super.onClose();
  }

  Future<void> createNote() async {
    if (contentController.text.isNotEmpty) {
      NoteModel note = NoteModel();
      note.favourites = favourites == true ? 1 : 0;
      note.hidden = hidden == true ? 1 : 0;

      note.content = contentController.text;
      note.title = titleController.text;
      note.date = _getCurrentDate();
      note.time = _getCurrentTime();
      int newRowId = await _noteDatabase.create(note);
      if (newRowId != 0) {
        note.id = newRowId;
        _allNotes.add(note);
        imageController.addNewImage();
        backToHomeScreen();
      }
    } else {
      showSnackBar(
        ManagerStrings.pleaseWriteAnything,
      );
    }
    update();
  }

  Future<void> backToHomeScreen() async {
    Get.back();
    imageController.clearList();
    contentController.text = '';
    titleController.text = '';
    favourites = false;
    hidden = false;
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

  Future<void> deleteNote(int id) async {
    bool deleted = await _noteDatabase.delete(id);
    if (deleted) {
      //_notes.remove(element)
    }
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

  Future<void> _readAllNote() async {
    loading = true;
    _allNotes = await _noteDatabase.read();
    _searchNotes = _allNotes;
    loading = false;
    update();
  }

  void searchNote(String text) {
    if (text.isEmpty) {
      _searchNotes = _allNotes;
    } else {
      _searchNotes = _allNotes
          .where((note) => note.content
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    }
    update();
  }

  void changeToEnglishLanguage() async {
    // if (_englishLanguage.value) {
    //   await Get.updateLocale(const Locale(Constants.arabicLanguage));
    //   SharedPreferencesController.setLanguage(Constants.arabicLanguage);
    // } else {
    //   await Get.updateLocale(const Locale(Constants.englishLanguage));
    //   SharedPreferencesController.setLanguage(Constants.arabicLanguage);
    // }
  }
}
