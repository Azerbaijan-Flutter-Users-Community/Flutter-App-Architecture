import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

part 'data_state.dart';

abstract class DataCubit<T> extends Cubit<DataState<T>> {
  final _logger = Logger('DataCubit<$T>');

  DataCubit() : super(DataState<T>());

  bool get emitInProgress => true;

  FutureOr<T> loadData([int? id]);

  void fetch([int? id]) async {
    emit(state.inProgress());

    try {
      final data = await loadData(id);

      if (data != null) {
        _logger.fine('$data');
        emit(state.success(data));
      } else {
        _logger.warning('data is null!');
        emit(state.failure());
      }
    } catch (e, s) {
      _logger.severe('$e => $s');
    }
  }
}
