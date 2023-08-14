import '../../../../config/constants.dart';

class NoteModel {
  late int id;
  late String content;
  late String date;
  late String time;
  late String color;

  NoteModel();

  NoteModel.fromMap(Map<String, dynamic> map) {
    id = map[Constants.idNoteColumn];
    content = map[Constants.contentNoteColumn];
    date = map[Constants.dateNoteColumn];
    time = map[Constants.timeNoteColumn];
    color = map[Constants.colorNoteColumn];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Constants.contentNoteColumn: content,
      Constants.dateNoteColumn: date,
      Constants.timeNoteColumn: time,
      Constants.colorNoteColumn: color,
    };
  }
}
