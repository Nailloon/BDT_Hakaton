import 'dart:io';

import 'package:bdt_hakaton/src/features/form/data/url_stat_dto.dart';
import 'package:bdt_hakaton/src/features/form/data_sources/interface_urls_data_sorce.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UrlsDataSource implements IURLsDataSource {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "http://85.209.9.140:8000",
  ));
  final String fastAPIurl = "/checkurls";
  final String statusUrl = "/status/";

  @override
  Future<List<UrlStatDTO>?> getStatsForUrls(
      List<String> urlsData, bool isNeedPlot) async {
    try {
      var response = await dio.post(
        fastAPIurl,
        data: urlsData,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      print("good");
      await Future.delayed(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final String taskId = response.data['task_id'];
        var getStatsResponse = await dio.get(
          '$statusUrl$taskId',
          options: Options(headers: {
            'Accept': 'application/json',
          }, receiveTimeout: const Duration(seconds: 50)),
        );
        if (getStatsResponse.data["status_id"] == 1) {
          final data = getStatsResponse.data["results"]["clusters"];
          print(data);
          List<UrlStatDTO> result = [];
          for (var document in data) {
            var keys = document.keys.toList();
            var values = document.values.toList();
            for (var i = 0; i < keys.length; i++) {
              result.add(UrlStatDTO.fromJson(keys[i], values[i]));
            }
          }
          return result;
        } else {
          print(getStatsResponse.data.toString());
        }
      } else if (response.statusCode == 422) {
        throw Exception('Validation Error');
      } else {
        throw Exception('Another Status Code: ${response.statusCode}');
      }
    } on Exception catch (e) {
      rethrow;
    }
    return null;
  }
}
