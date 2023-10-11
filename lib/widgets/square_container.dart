import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/screens/product_details_page.dart';
import 'package:e_commerce_project/widgets/favorite_button.dart';
import 'package:e_commerce_project/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SquareContainer extends StatelessWidget {
  final List<QueryDocumentSnapshot> products;

  SquareContainer({
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    List<QueryDocumentSnapshot> getRandomRecommendations(
      List<QueryDocumentSnapshot> allProducts,
      int numberOfRecommendations,
    ) {
      final Random random = Random();
      final Set<int> usedIndices = {}; // Track used indices
      final List<QueryDocumentSnapshot> recommendations = [];

      if (allProducts.length >= numberOfRecommendations) {
        while (recommendations.length < numberOfRecommendations) {
          final int randomIndex = random.nextInt(allProducts.length);

          // Check if the random index has not been used before
          if (!usedIndices.contains(randomIndex)) {
            recommendations.add(allProducts[randomIndex]);
            usedIndices.add(randomIndex); // Mark the index as used
          }
        }
      }
      return recommendations;
    }

    var recommendedProducts = getRandomRecommendations(products, 10);

    return Container(
      child: ListView.builder(
          itemCount: recommendedProducts.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final product = recommendedProducts[index];
            return GestureDetector(
              onTap: () =>
                  Get.to(() => ProductDetailsPage(productSnapshot: product)),
              child: Container(
                width: 250,
                height: 200,
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: GridTile(
                    header: GridTileBar(
                      title: const Spacer(),
                      trailing: FavoriteButton(productSnapshot: product),
                    ),
                    footer: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                      child: GridTileBar(
                        backgroundColor: Colors.black,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              product['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$${product['price']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: RoundedIconButton(
                          icon: Icons.shopping_cart_checkout,
                          backgroundColor: Colors.white,
                          productSnapshot: product,
                          iconColor: Colors.black,
                        ),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: CachedNetworkImage(
                        imageUrl: product['imageUrl'][0],
                        fit: BoxFit.cover,
                        //
                        errorWidget: (context, url, error) => const Image(
                          image: AssetImage('images/error1.jpg'),
                          fit: BoxFit.cover,
                        ),
                        placeholder: (context, url) => SpinKitCircle(
                          color: Colors.green.shade900,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
