import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomBottonNavBar extends StatefulWidget {
  const CustomBottonNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottonNavBar> createState() => _CustomBottonNavBarState();
}

class _CustomBottonNavBarState extends State<CustomBottonNavBar> {
  final _auth = FirebaseAuth.instance;

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
              Get.to(ProductCategoriesPage(categories: Category.categories));
            },
            icon: const Icon(
              Icons.category,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              if (_auth.currentUser?.email != null) {
                Get.to(const WishlistPage());
              } else {
                Get.to(SigninScreen());
              }
            },
            icon: const Icon(
              Icons.favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              if (_auth.currentUser?.email != null) {
                Get.to(const UserProfilePage());
              } else {
                Get.to(SigninScreen());
              }
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
