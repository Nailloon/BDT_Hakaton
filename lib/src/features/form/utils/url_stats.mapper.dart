import 'package:bdt_hakaton/src/features/form/data/url_stat_dto.dart';
import 'package:bdt_hakaton/src/features/form/model/url_stat_model.dart';

extension UrlsStatsMapper on UrlStatDTO{
  UrlStatModel toModel() => UrlStatModel(id: id, isIndexing: isIndexing);
}