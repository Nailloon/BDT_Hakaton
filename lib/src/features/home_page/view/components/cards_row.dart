import 'package:bdt_hakaton/src/common/mock_data/button_data.dart';
import 'package:bdt_hakaton/src/common/mock_data/cards_data.dart';
import 'package:bdt_hakaton/src/features/home_page/view/components/card.dart';
import 'package:flutter/material.dart';

class CardRow extends StatelessWidget {
  final List<Map<String, String>> cards = cardsData;
  final List<Map<String, VoidCallback>> buttons = buttonsData;
  CardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          cards.length,
          (index) => _buildCard(cards[index], context, buttons[index]),
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> card, context, Map<String, VoidCallback> button) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / cards.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SizedBox(
          child: PurpleCard(
            imageName: card.keys.first,
            text: card.values.first,
            buttonText: button.keys.first,
            action: button.values.first,
          ),
        ),
      ),
    );
  }
}
