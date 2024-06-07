import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final double height;
  final String buttonTitle;
  const ContainerButton({
    super.key,
    required this.height,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.amber,
      ),
      child: Center(
        child: Text(
          buttonTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
