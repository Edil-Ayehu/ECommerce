import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(name: 'Electronics', imageUrl: 'images/laptop.jpg'),
    Category(name: 'Clothings', imageUrl: 'images/shoe.jpg'),
    Category(name: 'Watch', imageUrl: 'images/watch.jpg'),
  ];
}
