import 'package:bdt_hakaton/src/features/form/data/url_stat_dto.dart';

abstract interface class IURLsDataSource{
  Future<List<UrlStatDTO>?> getStatsForUrls(List<String> urlsData);
}