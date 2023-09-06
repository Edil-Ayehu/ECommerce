import 'package:flutter/material.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/models/models.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 65,
      elevation: 6,
      color: Colors.white,
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
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(ProductCategoriesPage(categories: Category.categories));
            },
            icon: const Icon(
              Icons.category,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              Get.to(WishlistPage());
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(const UserProfilePage());
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
