import 'package:alpha_reader/domain/entities/font_size.dart';
import 'package:alpha_reader/domain/entities/substitutions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserDataRepository {
  //book
  Future<String> book();
  Future<void> setBook({required String bookKey});

  //page
  Future<int> pageIndex(String bookKey);
  Future<void> setPageIndex(String bookKey, int pageIndex);

  //bookMark
  Future<void> setBookMark(String bookKey, int pageIndex, String bookMark);
  Future<String> bookMark(String bookKey, int pageIndex);

  //bookMark
  Future<void> saveOffset(String bookKey, int pageIndex, double offset);
  Future<double> offset(String bookKey, int pageIndex);

  //substitution
  Future<Substitutions> substitutions();
  Future<void> setSubstitutions({required Substitutions sub});

  Future<FontSize> fontSize();
  Future<void> setFontSize({required FontSize size});

  Future<String> fontFamily();
  Future<void> setFontFamily({required String family});
}

class UserDataRepository implements IUserDataRepository {
  final SharedPreferences sharedPreferences;

  UserDataRepository({required this.sharedPreferences});

  @override
  Future<String> book() async {
    return sharedPreferences.getString('CURRENT_BOOK') ?? '';
  }

  @override
  Future<void> setBook({required String bookKey}) async {
    await sharedPreferences.setString('CURRENT_BOOK', bookKey);
  }

  @override
  Future<int> pageIndex(String bookKey) async {
    return sharedPreferences.getInt('BOOK_${bookKey}_PAGE') ?? 0;
  }

  @override
  Future<void> setPageIndex(String bookKey, int pageIndex) async {
    sharedPreferences.setInt('BOOK_${bookKey}_PAGE', pageIndex);
  }

  @override
  Future<Substitutions> substitutions() async {
    String? subStr = sharedPreferences.getString('SUBSTITUTIONS');
    if (subStr != null) {
      return Substitutions.fromString(subStr);
    } else {
      return Substitutions();
    }
  }

  @override
  Future<void> setSubstitutions({
    required Substitutions sub,
  }) async {
    sharedPreferences.setString(
      'SUBSTITUTIONS',
      Substitutions.toStringMap(sub.pairs),
    );
  }

  @override
  Future<String> fontFamily() async {
    return sharedPreferences.getString('FONTFAMILY') ?? '';
  }

  @override
  Future<void> setFontFamily({required String family}) async {
    sharedPreferences.setString('FONTFAMILY', family);
  }

  @override
  Future<FontSize> fontSize() async {
    double size = sharedPreferences.getDouble('FONTSIZE') ?? 0.0;

    return (size == 0) ? (FontSize.medium) : (FontSize.medium);
  }

  @override
  Future<void> setFontSize({required FontSize size}) async {
    sharedPreferences.setDouble('FONTSIZE', size.size ?? 0);
  }

  @override
  Future<String> bookMark(String bookKey, int pageIndex) async {
    String bookMark = sharedPreferences
            .getString('BOOKMARKbookKey${bookKey}pageIndex$pageIndex') ??
        'empty';

    return bookMark;
  }

  @override
  Future<void> setBookMark(
      String bookKey, int pageIndex, String bookMark) async {
    sharedPreferences.setString(
        'BOOKMARKbookKey${bookKey}pageIndex$pageIndex', bookMark);
  }

  @override
  Future<double> offset(String bookKey, int pageIndex) async {
    double offset = sharedPreferences
            .getDouble('OFFSETbookKey${bookKey}pageIndex$pageIndex') ??
        0;

    return offset;
  }

  @override
  Future<void> saveOffset(String bookKey, int pageIndex, double offset) async {
    sharedPreferences.setDouble(
        'OFFSETbookKey${bookKey}pageIndex$pageIndex', offset);
  }
}
