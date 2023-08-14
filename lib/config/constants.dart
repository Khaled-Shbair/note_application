class Constants {
  static const double designSizeWidth = 390;
  static const double designSizeHeight = 844;
  static const double elevationAppBar = 0;
  static const int durationOnBoardingScreen = 1;
  static const double blurRadiusOfBoxShadowToBottomContainerInOnBoardingScreen =
      2.73;
  static const double
      spreadRadiusOfBoxShadowToBottomContainerInOnBoardingScreen = 0;
  static const double xOffsetOfBoxShadow1ToBottomContainerInOnBoardingScreen =
      -0.91;
  static const double yOffsetOfBoxShadow1ToBottomContainerInOnBoardingScreen =
      -0.91;
  static const double xOffsetOfBoxShadow2ToBottomContainerInOnBoardingScreen =
      1.37;
  static const double yOffsetOfBoxShadow2ToBottomContainerInOnBoardingScreen =
      1.37;

  /// Constants Database properties
  static const String databaseName = 'db.sql';
  static int versionDatabase = 1;

  // 1- Note table
  static const String noteTableName = 'notes';
  static const String idNoteColumn = 'id';
  static const String contentNoteColumn = 'content';
  static const String dateNoteColumn = 'date';
  static const String timeNoteColumn = 'time';
  static const String colorNoteColumn = 'color';

  // 2- Image table
  static const String imageTableName = 'images';
  static const String idImageColumn = 'id';
  static const String noteIdImageColumn = 'id_note';
  static const String pathImageColumn = 'path_image';
}
