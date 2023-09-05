import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final List<String> subCategories;

  Category({required this.name, required this.subCategories});

  @override
  List<Object?> get props => [name, subCategories];

  static final List<Category> categories = [
    Category(
        name: 'Electronics',
        subCategories: const ['TV', 'Phone', 'Laptop', 'Headset', 'Tablet']),
    Category(name: 'Clothing', subCategories: const ['Men', 'Women', 'Kids']),
    Category(name: 'Furniture', subCategories: const []),
    Category(name: 'Automotive', subCategories: const []),
    Category(name: 'Pet Supplies', subCategories: const ['Dog', 'Cat']),
    Category(name: 'Jewelry', subCategories: const []),
    Category(name: 'Books', subCategories: const []),
    Category(name: 'Sports & Fitness', subCategories: const []),
    Category(name: 'Toys & Games', subCategories: const []),
  ];
}
