import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String categoryName;

  const CategoryHeader({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        categoryName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}