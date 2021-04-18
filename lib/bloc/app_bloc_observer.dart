import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class AppBlocObserver implements BlocObserver {
  final _logger = Logger('AppBlocObserver');

  @override
  void onCreate(BlocBase bloc) {
    _logger.fine('$bloc created.');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.info('${bloc.runtimeType} => $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.info('${bloc.runtimeType} => $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.info('${bloc.runtimeType} => $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.severe('${bloc.runtimeType} => $error, $stackTrace');
  }

  @override
  void onClose(BlocBase bloc) {
    _logger.fine('$bloc closed.');
  }
}
