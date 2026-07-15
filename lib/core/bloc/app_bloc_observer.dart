import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/config/flavor_config.dart';

// Use this for Crashlytics
class AppBlocObserver extends BlocObserver {
  final bool _condition = !isProduction && kDebugMode;

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (_condition) {
      debugPrint('onCreate => ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (_condition) {
      debugPrint('onEvent => ${bloc.runtimeType}, $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (_condition) {
      debugPrint('onChange => ${bloc.runtimeType}, $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (_condition) {
      debugPrint('onTransition => ${bloc.runtimeType}, $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (_condition) {
      debugPrint('onError => ${bloc.runtimeType}, $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (_condition) {
      debugPrint('onClose => ${bloc.runtimeType}');
    }
  }
}
