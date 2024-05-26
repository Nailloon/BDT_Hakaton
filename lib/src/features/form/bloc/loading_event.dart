part of 'loading_bloc.dart';

sealed class LoadingEvent {
  const LoadingEvent();
}

final class LoadEvent extends LoadingEvent {}

final class LoadURLsEvent extends LoadingEvent {
  final List<String> urls;
  final bool isNeedPlot;
  const LoadURLsEvent({required this.urls,required this.isNeedPlot});
}

final class ClearURLsEvent extends LoadingEvent{
  const ClearURLsEvent();
}