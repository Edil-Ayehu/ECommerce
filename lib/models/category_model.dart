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
    Category(name: 'Clothing', subCategories: ['Men', 'Women', 'Kids']),
    Category(name: 'Furniture', subCategories: []),
    Category(name: 'Automotive', subCategories: ['Car', 'Train', 'Bicycle']),
    Category(name: 'Pet Supplies', subCategories: ['Dog', 'Cat']),
    Category(name: 'Jewelry', subCategories: []),
    Category(name: 'Books', subCategories: []),
    Category(name: 'Sports & Fitness', subCategories: []),
    Category(name: 'Toys & Games', subCategories: []),
  ];
}
