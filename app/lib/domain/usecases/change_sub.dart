import '/domain/entities/substitutions.dart';
import '/features/core/data/user_data_repository.dart';

class ChangeSub {
  final IUserDataRepository repository;

  ChangeSub({required this.repository});

  Future<Substitutions> call({
    required Substitutions subs,
    required Substitution substitution,
  }) async {
    Substitutions result =
        Substitutions.fromString(Substitutions.toStringMap(subs.pairs));

    for (var e in result.pairs) {
      if (e.key == substitution.key) {
        e.active = !e.active;
        e.inProgress = true;
      }
    }
    await repository.setSubstitutions(sub: result);
    return result;
  }
}
