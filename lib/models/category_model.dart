import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final List<String> subCategories;

  const Category({required this.name, required this.subCategories});

  @override
  List<Object?> get props => [name, subCategories];

  static const List<Category> categories = [
    Category(
        name: 'Electronics',
        subCategories: ['TV', 'Phone', 'Laptop', 'Headset', 'Tablet']),
    Category(name: 'Clothing', subCategories: [
      'Men\'s Clothing',
      'Women\'s Clothing',
      'Kids\' Clothing',
      'Men\'s Shoes',
      'Women\'s Shoes',
      'Kids\' Shoes',
      'Sportswear',
      'Swimwear',
    ]),
    Category(name: 'Furniture', subCategories: []),
    Category(name: 'Vehicles', subCategories: [
      'Cars',
      'Tracks & Vans',
      'Motorcycles & Scooters',
      'Bicycles',
    ]),
    Category(name: 'Pet Supplies', subCategories: ['Dog', 'Cat']),
    Category(name: 'Jewelry', subCategories: [
      'Necklaces',
      'Earrings',
      'Bracelets',
      'Rings',
      'Watches',
    ]),
    Category(name: 'Books', subCategories: [
      'Fiction',
      'History',
      'Educational',
      'Self-Help',
      'Children\'s Books',
      'Cookbooks',
      'Religion',
    ]),
    Category(name: 'Sports & Fitness', subCategories: []),
    Category(name: 'Toys & Games', subCategories: []),
  ];
}
