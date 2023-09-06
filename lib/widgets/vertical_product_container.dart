import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../models/products_model.dart';

class VerticalProductContainer extends StatelessWidget {
  final Product product;

  VerticalProductContainer({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: w / 2.2,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
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
                  tag: product.productId,
                  child: CachedNetworkImage(
                    imageUrl: product.productImageUrl[0],
                    fit: BoxFit.cover,
                    height: 150,
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
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${product.productPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RoundedIconButton(
                    icon: Icons.add,
                    backgroundeColor: Colors.black,
                    product: product,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 9,
          right: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FavoriteButton(product: product),
          ),
        ),
      ],
    );
  }
}
