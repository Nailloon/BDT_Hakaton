import 'package:bdt_hakaton/src/features/home_page/view/components/cards_row.dart';
import 'package:flutter/material.dart';

class RequestFragment extends StatelessWidget {
  const RequestFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:900, width: MediaQuery.of(context).size.width, child: CardRow());
  }
}