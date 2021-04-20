part of 'data_cubit.dart';

class DataState<T> extends Equatable {
  DataState({
    this.isInProgress = false,
    this.isFailure = false,
    this.isSuccess = false,
    this.data,
  });

  final bool isInProgress;
  final bool isFailure;
  final bool isSuccess;
  final T? data;

  DataState<T> inProgress() => _copyWith(isInProgress: true);

  DataState<T> failure() => _copyWith(isFailure: true);

  DataState<T> success(T data) => _copyWith(isSuccess: true, data: data);

  DataState<T> _copyWith({
    final bool? isInProgress,
    final bool? isFailure,
    final bool? isSuccess,
    final T? data,
  }) =>
      DataState(
        isInProgress: isInProgress ?? false,
        isFailure: isFailure ?? false,
        isSuccess: isSuccess ?? false,
        data: data,
      );

  @override
  List<Object?> get props => [isInProgress, isFailure, isSuccess, data];
}
