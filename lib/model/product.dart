import 'package:flutter/material.dart';

class Product {
  final int id;
  final String image;
  final String title;
  final num price;
  final num rating;
  final num count;
  final String description;
  final String category;

  int quantityInCart = 1;

  String selectSizeInAlphabet = 'M';
  int selectSizeInNumeric = 1;
  Color selectSized = Colors.amber;

  String isAddedCard = 'Add to Cart';


  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.count,
    required this.description,
    required this.category,
  });

  factory Product.fromMap(Map map) {
    return Product(
      id: map['id'],
      image: map['image'],
      title: map['title'],
      price: map['price'],
      rating: map['rating']['rate'],
      count: map['rating']['count'],
      description: map['description'],
      category: map['category'],
    );
  }
}