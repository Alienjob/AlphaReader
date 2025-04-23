import '/domain/entities/substitutions.dart';
import '/features/core/data/user_data_repository.dart';

class MixDone {
  final IUserDataRepository repository;

  MixDone({required this.repository});

  Future<Substitutions> call({
    required Substitutions subs,
  }) async {
    Substitutions result =
        Substitutions.fromString(Substitutions.toStringMap(subs.pairs));

    for (var e in result.pairs) {
      e.inProgress = false;
    }
    await repository.setSubstitutions(sub: result);
    return result;
  }
}
