import 'package:flutter/material.dart';
import 'package:testing/model/product.dart';

class SelectQuantity extends StatelessWidget {
  final int index;
  final int selectQuantity;
  final VoidCallback onTap;
  final List<Product> cartItems;

  const SelectQuantity({
    super.key,
    required this.index,
    required this.selectQuantity,
    required this.onTap,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: cartItems[index].selectSizeInNumeric == selectQuantity
                  ? Colors.amber
                  : Colors.black,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(
            child: Text('$selectQuantity'),
          ),
        ),
      ),
    );
  }
}
