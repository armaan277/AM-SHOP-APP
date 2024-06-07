import 'package:flutter/material.dart';

class ChipSelector extends StatelessWidget {
  final VoidCallback onTap;
  final String chipSelector;
  final String chipTitle;
  final double height;
  final double width;

  const ChipSelector({
    super.key,
    required this.onTap,
    this.chipSelector = '',
    required this.chipTitle,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: chipSelector == 'select' ? Colors.amber : Colors.black,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              chipTitle,
              style: TextStyle(
                fontWeight: chipSelector == 'select'
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
