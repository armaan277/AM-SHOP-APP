import 'package:flutter/material.dart';
import 'package:testing/model/product.dart';

class SelectSized extends StatelessWidget {
  final int index;
  final String selectSized;
  final VoidCallback onTap;
  final List<Product> cartItems;

  const SelectSized({
    super.key,
    required this.index,
    required this.selectSized,
    required this.onTap,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: cartItems[index].selectSizeInAlphabet == selectSized
                ? Colors.amber
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Center(
          child: Text(selectSized),
        ),
      ),
    );
  }
}
