part of 'loading_bloc.dart';

sealed class LoadingEvent {
  const LoadingEvent();
}

final class LoadEvent extends LoadingEvent {}

final class LoadURLsEvent extends LoadingEvent {
  final List<String> urls;
  const LoadURLsEvent(this.urls);
}

final class ClearURLsEvent extends LoadingEvent{
  const ClearURLsEvent();
}