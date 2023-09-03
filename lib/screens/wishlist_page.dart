import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../models/products.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _favoriteProducts =
        Product.products.where((element) => element.isFavorite).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 2,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'My Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.to(const HomePage());
            },
            icon: const Icon(Icons.arrow_back)),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 15),
            _favoriteProducts.isEmpty ? Container() : CustomSearchBar(),
            const SizedBox(height: 15),
            ProductWidget(
              products: _favoriteProducts,
              onlyFavorite: true,
            ),
          ],
        ),
      ),
    );
  }
}
