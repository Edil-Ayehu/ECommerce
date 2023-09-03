import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/products.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;

  ProductsPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 8, right: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 8.0,
                mainAxisExtent: 220,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(ProductDetailsPage(
                          product: products[index],
                        ));
                      },
                      child: VerticalProductContainer(product: products[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
