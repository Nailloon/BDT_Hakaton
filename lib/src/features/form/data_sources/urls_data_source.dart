import 'package:bdt_hakaton/src/features/form/data/url_stat_dto.dart';
import 'package:bdt_hakaton/src/features/form/data_sources/interface_urls_data_sorce.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UrlsDataSource implements IURLsDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://85.209.9.140:8000"));
  final String fastAPIurl = "/checkurls";
  final String statusUrl = "/status/";

  @override
  Future<List<UrlStatDTO>?> getStatsForUrls(List<String> urlsData) async {
    try {
      var response = await dio.post(fastAPIurl, data: urlsData, options: Options(
    headers: {'Content-Type': 'application/json'},
  ),);
    print("good");
      if (response.statusCode == 200) {
        final String taskId = response.data['task_id'];
        bool infinitePolling = true;
        while (infinitePolling) {
          var getStatsResponse = await dio.get('$statusUrl$taskId');
          print("${getStatsResponse.data}");
          if (getStatsResponse.data["status_id"] == "complete" || getStatsResponse.data["status"] == 1) {
            infinitePolling = false;
            final data = getStatsResponse.data["results"];
            debugPrint(data);
            if (data is List) {
              return data.map<UrlStatDTO>((i) => UrlStatDTO.fromJson(i)).toList();
            } else {
              throw const FormatException('Response data is not a list');
            }
          }
        }
      } else if (response.statusCode == 422) {
        throw Exception('Validation Error');
      } else {
        throw Exception('Another Status Code: ${response.statusCode}');
      }
    } on Exception catch (e) {
      rethrow;
    }
    return null; // Return null if the function couldn't retrieve the data
  }
}