import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/models/models.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 65,
      elevation: 6,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Get.to(const HomePage());
            },
            icon: const Icon(
              Icons.home,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                  const ProductCategoriesPage(categories: Category.categories));
            },
            icon: const Icon(
              Icons.category,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Get.to(const WishlistPage());
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(const UserProfilePage());
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
