import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:testing/model/product.dart';

class APICalls {
  // This function return Only One response in API.
  static Future<Product> getClothDetail() async {
    Response response =
        await get(Uri.parse('https://fakestoreapi.com/products/1'));

    final mapResponse = jsonDecode(response.body);

    debugPrint('rating ${mapResponse['rating']['rate']}');
    return Product.fromMap(mapResponse);
  }

  // This function return All Response in API.
  static Future<Either<String, List<Product>>> getAllClothDetail() async {
    try {
      Response response =
          await get(Uri.parse('https://fakestoreapi.com/products'));

      final mapProductListResponse = jsonDecode(response.body);

      List<Product> productList = [];

      for (int i = 0; i < mapProductListResponse.length; i++) {
        productList.add(Product.fromMap(mapProductListResponse[i]));
      }
      return right(productList);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
