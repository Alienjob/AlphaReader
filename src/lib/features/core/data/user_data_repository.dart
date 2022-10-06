import 'package:AlphaReader/domain/entities/substitutions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserDataRepository {
  //book
  Future<String> book();
  Future<void> setBook(bookKey);

  //page
  Future<int> pageIndex(String bookKey);
  Future<void> setPageIndex(String bookKey, int pageIndex);

  //substitution
  Future<Substitutions> substitutions();
  Future<void> setSubstitutions({required Substitutions sub});
}

class UserDataRepository implements IUserDataRepository {
  final SharedPreferences sharedPreferences;

  UserDataRepository({required this.sharedPreferences});

  @override
  Future<String> book() async {
    return sharedPreferences.getString('CURRENT_BOOK') ?? '';
  }

  @override
  Future<void> setBook(bookKey) async {
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
}
