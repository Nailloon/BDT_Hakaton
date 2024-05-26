import 'dart:convert';
import 'dart:typed_data';

import 'package:bdt_hakaton/src/features/form/model/url_stat_model.dart';
import 'package:bdt_hakaton/src/theme/image_sources.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  final bool isNeedPlots;
  final String? imageBase64String;
  final List<UrlStatModel> stats;
  const StatsScreen(
      {super.key, required this.stats, required this.isNeedPlots, this.imageBase64String});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: List.generate(stats.length, (index) => _buildStat(stats[index])),
                ),
              ),
              (imageBase64String != null)
                  ? Expanded(
                      child: (isNeedPlots) ? imageFromBase64String(imageBase64String!) : Image.asset(ImageSources.optim, width: MediaQuery.of(context).size.width,))
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(UrlStatModel urlInfo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Text("ВАШ САЙТ: ${urlInfo.id}"),
          Text("Его параметр индексирования:${urlInfo.isIndexing}"),
          Divider()
        ])
      ],
    );
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}