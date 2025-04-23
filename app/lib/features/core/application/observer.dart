// ignore_for_file: avoid_print

import '/features/admob/application/bloc/ad_mob_bloc.dart';
import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (bloc is AdMobBloc) {
      print('ad log ${bloc.runtimeType} ${bloc.key} $event');
    } else {
      print('${bloc.runtimeType} $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is AdMobBloc) {
      print('ad log ${bloc.runtimeType} ${bloc.key} $change');
    } else {
      print('${bloc.runtimeType} $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (bloc is AdMobBloc) {
      print('ad log ${bloc.runtimeType} ${bloc.key} $transition');
    } else {
      print('${bloc.runtimeType} $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (bloc is AdMobBloc) {
      print('ad log ${bloc.runtimeType} ${bloc.key} $error $stackTrace');
    } else {
      print('${bloc.runtimeType} $error $stackTrace');
    }
    super.onError(bloc, error, stackTrace);
  }
}
