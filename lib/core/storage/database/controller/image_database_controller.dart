import '../../../../features/note/presentation/model/image_model.dart';
import '../database_operations.dart';
import '../database_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../config/constants.dart';

class ImageDatabaseController extends DatabaseOperations<ImageModel> {
  final Database _database = DatabaseProvider().database;

  @override
  Future<int> create(ImageModel object) async {
    int newRowId = await _database.insert(
      Constants.imageTableName,
      object.toMap(),
    );
    return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    int countOfDeletedRows = await _database.delete(
      Constants.imageTableName,
      where: '${Constants.idImageColumn} = ?',
      whereArgs: [id],
    );
    return countOfDeletedRows == 1;
  }

  @override
  Future<List<ImageModel>> read([int? id]) async {
    List<Map<String, dynamic>> rows = await _database.query(
      Constants.imageTableName,
      // where: '${Constants.idNoteColumn} = ?',
      // whereArgs: [id],
    );
    return rows.map((row) => ImageModel.fromMap(row)).toList();
  }

  @override
  Future<bool> update(ImageModel object) async {
    return false;
  }

  @override
  Future<ImageModel?> show(int id) async {
    List<Map<String, dynamic>> rows = await _database.query(
      Constants.imageTableName,
      where: '${Constants.idImageColumn} = ?',
      whereArgs: [id],
    );
    if (rows.isNotEmpty) {
      return ImageModel.fromMap(rows.first);
    }
    return null;
  }
}
