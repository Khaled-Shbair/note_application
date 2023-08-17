import '/config/all_imports.dart';

class NoteModel {
  late int id;
  late String title;
  late String content;
  late String date;
  late String time;
  late String image;
  late int favourites;
  late int trash;
  late int hidden;
  late int maxLinesOfContentNote;

  NoteModel();

  NoteModel.fromMap(Map<String, dynamic> map) {
    id = map[Constants.idNoteColumn];
    content = map[Constants.contentNoteColumn];
    date = map[Constants.dateNoteColumn];
    time = map[Constants.timeNoteColumn];
    title = map[Constants.titleNoteColumn];
    favourites = map[Constants.favouritesNoteColumn];
    hidden = map[Constants.hiddenNoteColumn];
    image = map[Constants.imageNoteColumn];
    trash = map[Constants.trashNoteColumn];
    maxLinesOfContentNote = map[Constants.maxLinesOfContentNoteColumn];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Constants.contentNoteColumn: content,
      Constants.dateNoteColumn: date,
      Constants.timeNoteColumn: time,
      Constants.titleNoteColumn: title,
      Constants.favouritesNoteColumn: favourites,
      Constants.hiddenNoteColumn: hidden,
      Constants.imageNoteColumn: image,
      Constants.trashNoteColumn: trash,
      Constants.maxLinesOfContentNoteColumn: maxLinesOfContentNote,
    };
  }
}
