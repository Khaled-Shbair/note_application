import 'dart:io';

import '../../../../config/constants.dart';

class ImageModel {
  late int id;
  late int noteId;
  late String image;

  // late File image;

  ImageModel();

  ImageModel.fromMap(Map<String, dynamic> map) {
    id = map[Constants.idImageColumn];
    image = map[Constants.pathImageColumn];
    // image.copy(map[Constants.imageTableName]);
    noteId = map[Constants.noteIdImageColumn];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // Constants.imageTableName: image.path,
      Constants.pathImageColumn: image,
      Constants.noteIdImageColumn: noteId,
    };
  }
}
