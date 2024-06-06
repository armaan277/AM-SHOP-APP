import 'package:flutter/material.dart';
import 'package:testing/model/product.dart';
import 'package:testing/screens/product_info_screen.dart';
import 'package:testing/widgets/container_button.dart';
import 'package:testing/widgets/quantity_select.dart';
import 'package:testing/widgets/rich_text.dart';
import 'package:testing/widgets/size_selector_container.dart';
import 'package:testing/widgets/sized_select.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;
  final ValueNotifier<int> totalCartProducts;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.totalCartProducts,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String iconData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'AM SHOP',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(iconData);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: _buildCarts(),
      ),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  Widget _buildCarts() {
    if (widget.cartItems.isEmpty) {
      return Center(
        child: Text(
          'No Item Available',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black54,
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.cartItems.length,
      itemBuilder: (context, index) {
        final product = widget.cartItems[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey.shade50,
            semanticContainer: false,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductInfoScreen(
                        product: product,
                        totalCartProducts: widget.totalCartProducts,
                        cartItems: widget.cartItems,
                      );
                    }));
                  },
                  child: Container(
                    color: Colors.white,
                    child: Hero(
                      tag: product.image,
                      child: Image.network(
                        product.image,
                        height: 170,
                        width: 140,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'A & M',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          product.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Sold by A & M Codeilm...',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        SizedBox(height: 7),
                        Text(
                          '\$${widget.cartItems[index].price * widget.cartItems[index].selectSizeInNumeric}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter blaBla) {
                                        return SizedBox(
                                          height: 216,
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Select Size'),
                                                    GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            Icon(Icons.close)),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SelectSized(
                                                      cartItems:
                                                          widget.cartItems,
                                                      index: index,
                                                      selectSized: 'XS',
                                                      onTap: () {
                                                        blaBla(() {
                                                          widget
                                                              .cartItems[index]
                                                              .selectSizeInAlphabet = 'XS';
                                                        });
                                                      },
                                                    ),
                                                    SelectSized(
                                                      cartItems:
                                                          widget.cartItems,
                                                      index: index,
                                                      selectSized: 'S',
                                                      onTap: () {
                                                        blaBla(() {
                                                          widget
                                                              .cartItems[index]
                                                              .selectSizeInAlphabet = 'S';
                                                        });
                                                      },
                                                    ),
                                                    SelectSized(
                                                      cartItems:
                                                          widget.cartItems,
                                                      index: index,
                                                      selectSized: 'M',
                                                      onTap: () {
                                                        blaBla(() {
                                                          widget
                                                              .cartItems[index]
                                                              .selectSizeInAlphabet = 'M';
                                                        });
                                                      },
                                                    ),
                                                    SelectSized(
                                                      cartItems:
                                                          widget.cartItems,
                                                      index: index,
                                                      selectSized: 'L',
                                                      onTap: () {
                                                        blaBla(() {
                                                          widget
                                                              .cartItems[index]
                                                              .selectSizeInAlphabet = 'L';
                                                        });
                                                      },
                                                    ),
                                                    SelectSized(
                                                      cartItems:
                                                          widget.cartItems,
                                                      index: index,
                                                      selectSized: 'XL',
                                                      onTap: () {
                                                        blaBla(() {
                                                          widget
                                                              .cartItems[index]
                                                              .selectSizeInAlphabet = 'XL';
                                                        });
                                                      },
                                                    ),
                                                    SelectSized(
                                                      cartItems:
                                                          widget.cartItems,
                                                      index: index,
                                                      selectSized: 'XLL',
                                                      onTap: () {
                                                        blaBla(() {
                                                          widget
                                                              .cartItems[index]
                                                              .selectSizeInAlphabet = 'XLL';
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: Text(
                                                  '\$${widget.cartItems[index].price * widget.cartItems[index].selectSizeInNumeric}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0),
                                                child: RichTexts(
                                                  titleOne: 'Seller: ',
                                                  titleTwo:
                                                      'A & M Hennes & Mauritz Retail Private Limited',
                                                ),
                                              ),
                                              SizedBox(height: 24),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                  setState(() {});
                                                },
                                                child: ContainerButton(
                                                  height: 50,
                                                  buttonTitle: 'Done',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: SizedSelectContainer(
                                sizeTitle:
                                    'Sized: ${widget.cartItems[index].selectSizeInAlphabet}',
                              ),
                            ),
                            SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder: (
                                      BuildContext context,
                                      StateSetter blaBla,
                                    ) {
                                      return SizedBox(
                                        height: 166,
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('Select Size'),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Icon(Icons.close)),
                                                ],
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  SelectQuantity(
                                                    cartItems: widget.cartItems,
                                                    index: index,
                                                    selectQuantity: 1,
                                                    onTap: () {
                                                      blaBla(() {
                                                        widget.cartItems[index]
                                                            .selectSizeInNumeric = 1;
                                                      });
                                                    },
                                                  ),
                                                  SelectQuantity(
                                                    cartItems: widget.cartItems,
                                                    index: index,
                                                    selectQuantity: 2,
                                                    onTap: () {
                                                      blaBla(() {
                                                        widget.cartItems[index]
                                                            .selectSizeInNumeric = 2;
                                                      });
                                                    },
                                                  ),
                                                  SelectQuantity(
                                                    cartItems: widget.cartItems,
                                                    index: index,
                                                    selectQuantity: 3,
                                                    onTap: () {
                                                      blaBla(() {
                                                        widget.cartItems[index]
                                                            .selectSizeInNumeric = 3;
                                                      });
                                                    },
                                                  ),
                                                  SelectQuantity(
                                                    cartItems: widget.cartItems,
                                                    index: index,
                                                    selectQuantity: 4,
                                                    onTap: () {
                                                      blaBla(() {
                                                        widget.cartItems[index]
                                                            .selectSizeInNumeric = 4;
                                                      });
                                                    },
                                                  ),
                                                  SelectQuantity(
                                                    cartItems: widget.cartItems,
                                                    index: index,
                                                    selectQuantity: 5,
                                                    onTap: () {
                                                      blaBla(() {
                                                        widget.cartItems[index]
                                                            .selectSizeInNumeric = 5;
                                                      });
                                                    },
                                                  ),
                                                  SelectQuantity(
                                                    cartItems: widget.cartItems,
                                                    index: index,
                                                    selectQuantity: 6,
                                                    onTap: () {
                                                      blaBla(() {
                                                        widget.cartItems[index]
                                                            .selectSizeInNumeric = 6;
                                                      });
                                                    },
                                                  ),
                                                  SelectQuantity(
                                                    cartItems: widget.cartItems,
                                                    index: index,
                                                    selectQuantity: 7,
                                                    onTap: () {
                                                      blaBla(() {
                                                        widget.cartItems[index]
                                                            .selectSizeInNumeric = 7;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 26),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                                setState(() {});
                                              },
                                              child: ContainerButton(
                                                  height: 50,
                                                  buttonTitle: 'Done'),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              child: SizedSelectContainer(
                                sizeTitle:
                                    'Qty: ${widget.cartItems[index].selectSizeInNumeric}',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        RichTexts(
                          titleOne: '7 days ',
                          titleTwo: 'return available',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      widget.totalCartProducts.value =
                          widget.totalCartProducts.value -
                              widget.cartItems[index].quantityInCart;
                      widget.cartItems[index].quantityInCart = 1;
                      widget.cartItems[index].selectSizeInNumeric = 1;
                      widget.cartItems[index].selectSizeInAlphabet = 'M';
                      iconData =
                          widget.cartItems[index].isAddedCard = 'Add to Cart';
                      widget.cartItems.removeAt(index);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Center(
                            child: Text('Remove Item !!!'),
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.amber,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    double total = widget.cartItems
        .fold(0, (sum, item) => sum + (item.price * item.selectSizeInNumeric));

    return InkWell(
      onTap: () {
        if (total == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 500),
              content: Center(
                child: Text('No Item Available !!!'),
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 500),
              content: Center(
                child: Text('Armaan Your Order is Successfully Order !!!'),
              ),
            ),
          );
        }
      },
      child: ContainerButton(
          height: 60,
          buttonTitle: 'Place order: \$${total.toStringAsFixed(2)}'),
    );
  }
}
