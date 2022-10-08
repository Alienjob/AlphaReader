abstract class IBook {
  String get key;
  String get title;
  String get description;
  String get imageData;

  int get length;

  String pageText(int pageIndex);
}
