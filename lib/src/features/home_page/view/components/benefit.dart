import 'package:flutter/material.dart';

class BenefitWithIcon extends StatelessWidget {
  final String benefit;
  const BenefitWithIcon({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            benefit,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.left,
          ),
        )
      ]);
  }
}