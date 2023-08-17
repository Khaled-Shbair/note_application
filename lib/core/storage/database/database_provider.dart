import '/config/all_imports.dart';

/*
   * Singleton design patten : user to take only one object from this class.
   * Implement Singleton design patten:-
   *  1- make constructor private, to prevent create object.
   *  2- create instance (object) from this class inside class and make private.
   *  3- create factory constructor to return this instance.
   * Factory constructor: constructor use to return value.
   */
class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider _instance = DatabaseProvider._();

  factory DatabaseProvider() {
    return _instance;
  }

  static late Database _database;

  Database get database => _database;

  static Future<void> initDatabase() async {
    // get place of application in mobile
    Directory directory = await getApplicationDocumentsDirectory();
    // Combine of application location with name database
    String path = join(directory.path, Constants.databaseName);
    _database = await openDatabase(
      path,
      version: 2,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE  ${Constants.noteTableName}(
            ${Constants.idNoteColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${Constants.titleNoteColumn} TEXT NOT NULL,
            ${Constants.contentNoteColumn} TEXT,
            ${Constants.dateNoteColumn} TEXT NOT NULL,
            ${Constants.timeNoteColumn} TEXT NOT NULL,
            ${Constants.favouritesNoteColumn} INTEGER NOT NULL,
            ${Constants.hiddenNoteColumn} INTEGER NOT NULL,
            ${Constants.trashNoteColumn} INTEGER NOT NULL,
            ${Constants.maxLinesOfContentNoteColumn} INTEGER NOT NULL,
            ${Constants.imageNoteColumn} TEXT
        )''');
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVersion) {},
    );
  }
}
