import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../../../core/storage/database/controller/image_database_controller.dart';
import '../model/image_model.dart';

class ImageController {
  late final ImageDatabaseController _imageDatabase = ImageDatabaseController();

  List<ImageModel> _allImagesNotes = <ImageModel>[];
  List<ImageModel> _imagesNote = <ImageModel>[];
  List<ImageModel> _newImagesNote = <ImageModel>[];
  File? _file;
  File? _saveImage;

  File? get file => _file;

  List<ImageModel> get imagesNote => _imagesNote;

  List<ImageModel> get newImagesNote => _newImagesNote;

  List<ImageModel> get allImagesNotes => _allImagesNotes;

  void clearList() {
    _imagesNote = [];
    _newImagesNote = [];
  }

  void addNewImage() {
    _allImagesNotes.addAll(_newImagesNote);
  }

  void readAllImages() async {
    _allImagesNotes = await _imageDatabase.read();
  }

  void image(int? noteId) async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600,
    );
    if (imageFile != null) {
      _file = File(imageFile.path);
    }
    Directory directory = await getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile!.path);
    _saveImage = await _file!.copy('${directory.path}/$fileName');
    _save(noteId: noteId);
  }

  void _save({int? noteId, int length = 0}) async {
    ImageModel image = ImageModel();
    if (_saveImage != null) {
      image.image = _saveImage!.path;
      //image.noteId = noteId ?? _allNotes.length + 1;
      image.noteId = noteId ?? length;
      int newRowId = await _imageDatabase.create(image);

      if (newRowId != 0) {
        image.id = newRowId;
        _newImagesNote.add(image);
      }
    }
  }

  void returnImage(int noteId) {
    _imagesNote =
        _allImagesNotes.where((image) => image.noteId == noteId).toList();
  }
}
