import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

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
      name: 'Electronics',
      subCategories: ['TV', 'Phone', 'Laptop', 'Headset', 'Tablet'],
      icon: Icons.laptop_chromebook,
    ),
    const Category(
      name: 'Clothing',
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
      name: 'Furniture',
      subCategories: [],
      icon: Icons.chair,
    ),
    const Category(
      name: 'Vehicles',
      subCategories: [
        'Cars',
        'Tracks & Vans',
        'Motorcycles & Scooters',
        'Bicycles',
      ],
      icon: Icons.car_crash,
    ),
    const Category(
      name: 'Pet Supplies',
      subCategories: ['Dog', 'Cat'],
      icon: Icons.pets_outlined,
    ),
    const Category(
      name: 'Jewelry',
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
      name: 'Books',
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
      name: 'Sports & Fitness',
      subCategories: [],
      icon: Icons.sports_baseball,
    ),
    const Category(
      name: 'Toys & Games',
      subCategories: [],
      icon: Icons.toys,
    ),
  ];
}
