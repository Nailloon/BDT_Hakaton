part of 'loading_bloc.dart';

sealed class LoadingState {
  final List<UrlStatModel> urlModels;
  const LoadingState(this.urlModels);
}

final class LoadingInitial extends LoadingState {
  const LoadingInitial(super.categories);
}

final class LoadingCompleted extends LoadingState {
  const LoadingCompleted(super.categories);
}

final class LoadingFailure extends LoadingState {
  final Object? exception;

  const LoadingFailure(super.categories,
      {required this.exception});
}