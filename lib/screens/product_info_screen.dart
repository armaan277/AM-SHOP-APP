import 'package:flutter/material.dart';
import 'package:testing/model/product.dart';
import 'package:testing/screens/cart_screen.dart';
import 'package:testing/widgets/container_button.dart';

class ProductInfoScreen extends StatefulWidget {
  final Product product;
  final ValueNotifier<int> totalCartProducts;
  final List<Product> cartItems;
  const ProductInfoScreen({
    super.key,
    required this.product,
    required this.totalCartProducts,
    required this.cartItems,
  });

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          'Cart Details',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Hero(
                      tag: widget.product.image,
                      child: Image.network(
                        widget.product.image,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, -3),
                          blurRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ListView(
                          children: [
                            Text(
                              widget.product.category.toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.product.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '\$${widget.product.price}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 55.0),
                              child: Text(
                                textAlign: TextAlign.justify,
                                widget.product.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: InkWell(
        onTap: () {
          if (widget.cartItems.contains(widget.product)) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return CartScreen(
                cartItems: widget.cartItems,
                totalCartProducts: widget.totalCartProducts,
              );
            })).then((_) {
              setState(() {});
            });
          } else {
            widget.product.isAddedCard = 'Go to bag';
            widget.totalCartProducts.value++;
            widget.cartItems.add(widget.product);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Added to Cart'),
                duration: Duration(milliseconds: 500),
              ),
            );
          }
          setState(() {});
        },
        child: ContainerButton(
          height: 60,
          buttonTitle: widget.product.isAddedCard,
        ),
      ),
    );
  }
}
