import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends Equatable {
  final String name;
  final List<String> subCategories;
  final IconData icon;

  const Category({
    required this.name,
    required this.subCategories,
    required this.icon,
  });

  @override
  List<Object?> get props => [name, subCategories, icon];

  static final List<Category> categories = [
    const Category(
      name: 'electronics',
      subCategories: ['TV', 'Phone', 'Laptop', 'Headset', 'Tablet'],
      icon: Icons.laptop_chromebook,
    ),
    const Category(
      name: 'clothing',
      subCategories: [
        'Men\'s Clothing',
        'Women\'s Clothing',
        'Kids\' Clothing',
        'Men\'s Shoes',
        'Women\'s Shoes',
        'Kids\' Shoes',
        'Sportswear',
        'Swimwear',
      ],
      icon: Icons.shopping_bag,
    ),
    const Category(
      name: 'furnitures',
      subCategories: [],
      icon: Icons.chair,
    ),
    const Category(
      name: 'vehicles',
      subCategories: [
        'Cars',
        'Tracks & Vans',
        'Motorcycles & Scooters',
        'Bicycles',
      ],
      icon: Icons.car_crash,
    ),
    const Category(
      name: 'pet',
      subCategories: ['Dog', 'Cat'],
      icon: Icons.pets_outlined,
    ),
    const Category(
      name: 'jewelry',
      subCategories: [
        'Necklaces',
        'Earrings',
        'Bracelets',
        'Rings',
        'Watches',
      ],
      icon: Icons.filter_drama,
    ),
    const Category(
      name: 'books',
      subCategories: [
        'Fiction',
        'History',
        'Educational',
        'Self-Help',
        'Children\'s Books',
        'Cookbooks',
        'Religion',
      ],
      icon: Icons.book_online,
    ),
    const Category(
      name: 'sports & fitness',
      subCategories: [],
      icon: Icons.sports_baseball,
    ),
    const Category(
      name: 'toys & games',
      subCategories: [],
      icon: Icons.toys,
    ),
  ];
}
