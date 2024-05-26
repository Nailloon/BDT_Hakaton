import 'package:bdt_hakaton/src/features/form/data/url_stat_dto.dart';

abstract interface class IURLsDataSource{
  Future<Map<List<UrlStatDTO>,String?>?> getStatsForUrls(List<String> urlsData, bool isNeedPlot);
}