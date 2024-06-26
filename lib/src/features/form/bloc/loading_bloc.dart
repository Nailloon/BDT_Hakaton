import 'package:bdt_hakaton/src/features/form/data/url_stat_dto.dart';
import 'package:bdt_hakaton/src/features/form/data_sources/urls_data_source.dart';
import 'package:bdt_hakaton/src/features/form/model/url_stat_model.dart';
import 'package:bdt_hakaton/src/features/form/utils/url_stats.mapper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  List<UrlStatModel> urlsForApp;
  UrlsDataSource networkDataSource = UrlsDataSource();
  LoadingBloc({required this.urlsForApp}) : super(LoadingInitial([], false, null)) {
    on<LoadURLsEvent>(_handleLoadUrlsEvent);
  }
  void _handleLoadUrlsEvent(
      LoadURLsEvent event, Emitter<LoadingState> emit) async {
    try {
      emit(LoadingInProgress(urlsForApp, event.isNeedPlot, null));
      Map<List<UrlStatDTO>, String?>? urlsForAppDTO = await networkDataSource.getStatsForUrls(
              event.urls, event.isNeedPlot);
      var keys = urlsForAppDTO!.keys.first;
      var image = urlsForAppDTO!.values.first;
      urlsForApp = keys.map((e) => e.toModel()).toList();
      debugPrint("urls:$urlsForApp");
      emit(LoadingCompleted(urlsForApp, event.isNeedPlot, image));
    } on Exception catch (e) {
      debugPrint(e.toString());
      emit(LoadingFailure(urlsForApp, event.isNeedPlot,null, exception: e));
    }
  }
}
