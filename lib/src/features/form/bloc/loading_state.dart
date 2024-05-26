part of 'loading_bloc.dart';

sealed class LoadingState {
  final List<UrlStatModel> urlModels;
  final bool isNeedPlot;
  const LoadingState(this.urlModels, this.isNeedPlot);
}

final class LoadingInitial extends LoadingState {
  const LoadingInitial(super.categories, super.isNeedPlot);
}

final class LoadingCompleted extends LoadingState {
  const LoadingCompleted(super.categories, super.isNeedPlot);
}

final class LoadingFailure extends LoadingState {
  final Object? exception;

  const LoadingFailure(super.categories,super.isNeedPlot,
      {required this.exception});
}

final class LoadingInProgress extends LoadingState{
  const LoadingInProgress(super.categories, super.isNeedPlot);
}