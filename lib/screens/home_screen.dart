import 'package:flutter/material.dart';
import 'package:testing/app_drawer.dart';
import 'package:testing/controllers/am_app_controller.dart';
import 'package:testing/model/product.dart';
import 'package:testing/screens/cart_screen.dart';
import 'package:testing/screens/product_info_screen.dart';
import 'package:testing/widgets/chip_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  List<Product> products = [];

  List<Product> productsCart = [];

  ValueNotifier<int> totalCartProducts = ValueNotifier(0);

  String select = '';

  bool isAllDataisLoading = true;

  String isProductsFound = 'Product Not Found!!!';

  String errorAPI = '';

  @override
  void initState() {
    super.initState();
    getDetailProduct();
    setState(() {});
  }

  void getDetailProduct() async {
    final result = await APICalls.getAllClothDetail();
    result.fold((l) {
      errorAPI = l;
    }, (r) {
      products = r;
    });
    isAllDataisLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'AM SHOP!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CartScreen(
                      cartItems: productsCart,
                      totalCartProducts: totalCartProducts,
                    );
                  },
                ),
              ).then((_) {
                setState(() {});
              });
            },
            icon: Badge(
              label: ValueListenableBuilder(
                valueListenable: totalCartProducts,
                builder: (context, value, child) {
                  return Text('${totalCartProducts.value}');
                },
              ),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChipSelector(
                    width: 50,
                    height: 40,
                    chipTitle: 'All',
                    onTap: () {
                      select = '';
                      setState(() {});
                    },
                    chipSelector: select == '' ? 'select' : '',
                  ),
                  ChipSelector(
                    width: 65,
                    height: 40,
                    chipTitle: "Men's",
                    onTap: () {
                      select = "men's clothing";
                      setState(() {});
                    },
                    chipSelector: select == "men's clothing" ? 'select' : '',
                  ),
                  ChipSelector(
                    chipTitle: "Women's",
                    onTap: () {
                      select = "women's clothing";
                      setState(() {});
                    },
                    chipSelector: select == "women's clothing" ? 'select' : '',
                    height: 40,
                    width: 82,
                  ),
                  ChipSelector(
                    height: 40,
                    width: 84,
                    chipTitle: 'Jewelery',
                    chipSelector: select == 'jewelery' ? 'select' : '',
                    onTap: () {
                      select = "jewelery";
                      setState(() {});
                    },
                  ),
                  ChipSelector(
                    chipSelector: select == "electronics" ? 'select' : '',
                    onTap: () {
                      select = "electronics";
                      setState(() {});
                    },
                    chipTitle: 'Electronics',
                    height: 40,
                    width: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          searchController.clear();
                          setState(() {});
                        },
                      ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 5.0),
                border: const OutlineInputBorder(),
                hintText: 'Search',
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 5),
            Expanded(child: _buildProductListView()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductListView() {
    String searchQuery = searchController.text.toLowerCase();
    final filteredProducts = products
        .where((product) =>
            product.title.toLowerCase().contains(searchQuery) &&
            product.category == select)
        .toList();

    final filteredProductsAll = products
        .where((element) => element.title.toLowerCase().contains(searchQuery))
        .toList();

    if (select == '') {
      return isAllDataisLoading
          ? const SizedBox(
              height: 550,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            )
          : errorAPI.isNotEmpty
              ? errorAPIMsg()
              : showProductDetails(filteredProducts: filteredProductsAll);
    } else {
      if (errorAPI.isNotEmpty) {
        return errorAPIMsg();
      } else {
        return showProductDetails(filteredProducts: filteredProducts);
      }
    }
  }

  Widget errorAPIMsg() {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        'Server down!!! $errorAPI',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget showProductDetails({required List<Product> filteredProducts}) {
    if (filteredProducts.isEmpty) {
      return const SizedBox(
        height: 500,
        child: Center(
          child: Text(
            'Product Not Found!!!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black54,
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductInfoScreen(
                    cartItems: productsCart,
                    product: product,
                    totalCartProducts: totalCartProducts,
                  );
                },
              ),
            ).then((_) {
              setState(() {});
            });
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            semanticContainer: false,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: Hero(
                    tag: product.image,
                    child: Image.network(
                      product.image,
                      height: 150,
                      width: 150,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          product.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '⭐ ${product.rating} / ${product.count}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                ),
                                onPressed: () async {
                                  if (productsCart.contains(product)) {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return CartScreen(
                                              cartItems: productsCart,
                                              totalCartProducts:
                                                  totalCartProducts);
                                        },
                                      ),
                                    );
                                  } else {
                                    productsCart.add(product);
                                    product.isAddedCard = 'Go to bag';
                                    totalCartProducts.value++;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        duration: Duration(milliseconds: 500),
                                        content: Center(
                                          child: Text('Added to Cart'),
                                        ),
                                      ),
                                    );
                                  }
                                  setState(() {});
                                },
                                child: Text(
                                  product.isAddedCard,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
}
