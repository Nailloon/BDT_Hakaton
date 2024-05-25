import 'package:bdt_hakaton/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onSelected;

  const CategoryChip(
      {super.key,
      required this.text,
      required this.onSelected,
      required this.isSelected});

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isSelected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CategoryChip oldWidget) {
    if (widget.isSelected != _isSelected) {
      setState(() {
        _isSelected = widget.isSelected;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: _isSelected ? AppColors.purple : AppColors.lightGrey,
      side: BorderSide.none,
      label: Text(widget.text),
      padding: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      labelStyle: _isSelected ? Theme.of(context).textTheme.bodySmall : Theme.of(context).textTheme.bodyMedium,
      onPressed: widget.onSelected,
    );
  }
}