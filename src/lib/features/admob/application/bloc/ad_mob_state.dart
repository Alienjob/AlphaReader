part of 'ad_mob_bloc.dart';

@immutable
class AdMobState {
  final bool adFree;

  const AdMobState(this.adFree);
}

class AdMobInitial extends AdMobState {
  const AdMobInitial() : super(false);
}
