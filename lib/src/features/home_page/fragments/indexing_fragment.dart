import 'package:bdt_hakaton/src/common/mock_data/benefits.dart';
import 'package:bdt_hakaton/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndexingFragment extends StatelessWidget {
  final List<String> benefits = benefits_list;
  IndexingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: benefits.sublist(0, (benefits.length ~/ 2)).map(_buildBenefit).toList(),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 2,
              child: Image.asset(ImageSources.indexingProfits),),
          Expanded(
            flex: 1,
            child: Column(children: benefits.sublist((benefits.length ~/ 2)).map(_buildBenefit).toList(),),
          )
        ],
      ),
    );
  }

  Widget _buildBenefit(String benefit) {
    return Row(
      children: [
        Icon(Icons.check, size: 20,),
        SizedBox(width: 10,),
        Text(benefit, style: TextStyle(fontSize: 16),)
      ],
    );
  }
}
