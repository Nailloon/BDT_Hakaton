import 'package:bdt_hakaton/src/features/home_page/fragments/indexing_fragment.dart';
import 'package:bdt_hakaton/src/features/home_page/fragments/project_fragment.dart';
import 'package:bdt_hakaton/src/features/home_page/fragments/request_fragment.dart';
import 'package:flutter/material.dart';

class ChoosenFragment extends StatelessWidget {
  final int index;
  const ChoosenFragment({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: [
        const ProjectFragment(),
        IndexingFragment(),
        const RequestFragment()
      ],
    );
  }
}
