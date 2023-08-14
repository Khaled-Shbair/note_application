import '../../../../../features/note/presentation/model/note_model.dart';
import '../database_operations.dart';
import '../database_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../config/constants.dart';

class NoteDatabaseController extends DatabaseOperations<NoteModel> {
  final Database _database = DatabaseProvider().database;

  @override
  Future<int> create(NoteModel object) async {
    int newRowId = await _database.insert(
      Constants.noteTableName,
      object.toMap(),
    );
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await _database.delete(
      Constants.noteTableName,
      where: '${Constants.idNoteColumn} = ?',
      whereArgs: [id],
    );
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<NoteModel>> read([int? id]) async {
    List<Map<String, dynamic>> rows = await _database.query(
      Constants.noteTableName,
    );
    return rows.map((row) => NoteModel.fromMap(row)).toList();
  }

  @override
  Future<bool> update(NoteModel object) async {
    int countOfUpdatedRows = await _database.update(
      Constants.noteTableName,
      object.toMap(),
      where: '${Constants.idNoteColumn} = ?',
      whereArgs: [object.id],
    );
    return countOfUpdatedRows == 1;
  }

  @override
  Future<NoteModel?> show(int id) async {
    List<Map<String, dynamic>> rows = await _database.query(
      Constants.noteTableName,
      where: '${Constants.idNoteColumn} = ?',
      whereArgs: [id],
    );
    if (rows.isNotEmpty) {
      return NoteModel.fromMap(rows.first);
    }
    return null;
  }
}
