import 'package:bdt_hakaton/src/common/mock_data/benefits.dart';
import 'package:bdt_hakaton/src/features/home_page/view/components/benefit.dart';
import 'package:bdt_hakaton/src/theme/image_sources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndexingFragment extends StatelessWidget {
  final List<String> benefits = benefitsList;
  IndexingFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: benefits
                    .sublist(0, (benefits.length ~/ 2))
                    .map(_buildBenefit)
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Image.asset(ImageSources.indexingProfits),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: benefits
                    .sublist((benefits.length ~/ 2))
                    .map(_buildBenefit)
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBenefit(String benefit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BenefitWithIcon(benefit: benefit),
    );
  }
}
