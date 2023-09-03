import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/products.dart';
import 'package:flutter/material.dart';

import '../screens/product_details_page.dart';

class ProductWidget extends StatelessWidget {
  final List<Product> products;
  final bool onlyFavorite;
  final int itemCount;

  ProductWidget(
      {required this.products, this.onlyFavorite = false, this.itemCount = 0});

  @override
  Widget build(BuildContext context) {
    return onlyFavorite
        ? Expanded(
            child: products.isEmpty
                ? const EmptyWishlistContainer()
                : ListView.builder(
                    itemCount: products.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(
                                  product: products[index],
                                );
                              },
                            ),
                          );
                        },
                        child: HorizontalProductContainer(
                          product: products[index],
                        ),
                      );
                    },
                  ),
          )
        : Expanded(
            child: GridView.builder(
              // itemCount: (itemCount > products.length) ? products.length : itemCount ?? products.length,
              itemCount:
                  (itemCount > products.length) ? products.length : itemCount,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 220,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ProductDetailsPage(
                        product: products[index],
                      );
                    }));
                  },
                  child: VerticalProductContainer(
                    product: products[index],
                  ),
                );
              },
            ),
          );
  }
}
