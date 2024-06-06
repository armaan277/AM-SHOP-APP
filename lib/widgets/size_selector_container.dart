import 'package:flutter/material.dart';

class SizedSelectContainer extends StatelessWidget {
  final String sizeTitle;
  const SizedSelectContainer({
    super.key,
    required this.sizeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 7.4),
            child: Text(
              sizeTitle,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
          ),
        ],
      ),
    );
  }
}
