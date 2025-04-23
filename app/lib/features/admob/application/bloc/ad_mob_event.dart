part of 'ad_mob_bloc.dart';

@immutable
abstract class AdMobEvent {}

class AdMobEventInit implements AdMobEvent {}

class AdMobEventTrue implements AdMobEvent {}

class AdMobEventFalse implements AdMobEvent {}
