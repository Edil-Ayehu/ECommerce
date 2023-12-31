import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../models/products_model.dart';

class VerticalProductContainer extends StatelessWidget {
  final QueryDocumentSnapshot productSnapshot;

  const VerticalProductContainer({
    super.key,
    required this.productSnapshot,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    // Access data from the productSnapshot
    // final String productId = productSnapshot.id;
    // final Map<String, dynamic> productData =
    //     productSnapshot.data() as Map<String, dynamic>;
    // final String productName = productData['name'];
    // final double productPrice = productData['price'];
    // final List<String> productImageUrl =
    //     List<String>.from(productData['imageUrl']);

    return Stack(
      children: [
        Container(
          width: w / 2.1,
          height: 240,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
                child: Hero(
                  tag: productSnapshot.id,
                  child: CachedNetworkImage(
                    imageUrl: productSnapshot['imageUrl'][0],
                    fit: BoxFit.cover,
                    height: 170,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productSnapshot['name'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$${productSnapshot['price']}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    RoundedIconButton(
                      icon: Icons.add,
                      backgroundColor: Get.isDarkMode
                          ? const Color(0xFF2C2D30)
                          : Colors.black,
                      productSnapshot: productSnapshot,
                      // Pass the product data as needed
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 4,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FavoriteButton(
              // Pass the product data as needed
              productSnapshot: productSnapshot,
            ),
          ),
        ),
      ],
    );
  }
}
