abstract class FB2Book {
  String get key;
  String get title;
  String get description;
  String get imagePath;

  int get length;

  String pageText(int pageIndex);
}
