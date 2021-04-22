import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

typedef Predicate<T> = bool Function(T);

const _defaultTimeout = Duration(seconds: 20);

extension WaitableCubitExt<State> on Cubit<State> {
  Future<T> waitFor<T extends State>({
    Predicate<T>? predicate,
    Duration timeout = _defaultTimeout,
  }) {
    final completer = Completer<T>();
    late StreamSubscription subscription;

    subscription = stream.listen(
      (state) {
        if (state is T) {
          if (predicate != null && predicate(state)) {
            subscription.cancel();
            completer.complete(state);
          }
        }
      },
    );

    Future.delayed(timeout, () {
      if (!completer.isCompleted) {
        subscription.cancel();
        completer.completeError(TimeoutException(
          'Cubit have not emit required state.',
          timeout,
        ));
      }
    });

    return completer.future;
  }
}
