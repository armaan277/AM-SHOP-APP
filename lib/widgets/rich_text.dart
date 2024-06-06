import 'package:flutter/material.dart';

class RichTexts extends StatelessWidget {
  final String titleOne;
  final String titleTwo;
  const RichTexts({
    super.key,
    required this.titleOne,
    required this.titleTwo,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: titleOne,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: titleTwo,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
