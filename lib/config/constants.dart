class Constants {
  static const double designSizeWidth = 390;
  static const double designSizeHeight = 844;
  static const double elevationAppBar = 0;
  static const double zeroElevation = 0;
  static const double thicknessOfDividerInMyScaffoldApp = 0.5;
  static const int durationOnBoardingScreen = 1;
  static const int durationSplashScreen = 3;
  static const double spreadRadius = 0;

  static const double blurRadiusOfContainerShapeOfNote = 1;
  static const double xOffsetOfContainerShapeOfNote = 0.0;
  static const double yOffsetOfContainerShapeOfNote = 0.0;

  static const double blurRadiusOfBoxShadowToBottomContainerInOnBoardingScreen =
      2.73;
  static const double xOffsetOfBoxShadow1ToBottomContainerInOnBoardingScreen =
      -0.91;
  static const double yOffsetOfBoxShadow1ToBottomContainerInOnBoardingScreen =
      -0.91;
  static const double xOffsetOfBoxShadow2ToBottomContainerInOnBoardingScreen =
      1.37;
  static const double yOffsetOfBoxShadow2ToBottomContainerInOnBoardingScreen =
      1.37;
  static int maxLinesInContentNoteFiled = 1000;

  /// Constants Database properties
  static const String databaseName = 'db.sql';
  static int versionDatabase = 1;

  // 1- Note table
  static const String noteTableName = 'notes';
  static const String idNoteColumn = 'id';
  static const String titleNoteColumn = 'title';
  static const String contentNoteColumn = 'content';
  static const String dateNoteColumn = 'date';
  static const String timeNoteColumn = 'time';
  static const String favouritesNoteColumn = 'favourites';
  static const String hiddenNoteColumn = 'hidden';
  static const String trashNoteColumn = 'trash';
  static const String imageNoteColumn = 'image';
  static const String maxLinesOfContentNoteColumn = 'max_lines_of_content_note';
}
