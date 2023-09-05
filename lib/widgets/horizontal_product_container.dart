import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../models/products_model.dart';

class HorizontalProductContainer extends StatefulWidget {
  final Product product;

  HorizontalProductContainer({
    required this.product,
  });

  @override
  State<HorizontalProductContainer> createState() =>
      _HorizontalProductContainerState();
}

class _HorizontalProductContainerState
    extends State<HorizontalProductContainer> {
  addItemToCart(CartItem newItem) {
    bool itemExists =
        CartItem.cartItems.any((item) => item.name == newItem.name);
    if (itemExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('The Product is already in the Cart!'),
        ),
      );
    } else {
      CartItem.cartItems.add(newItem);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added to the cart successfully!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Hero(
              tag: widget.product.productId,
              child: Container(
                width: 130,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: widget.product.productImageUrl[0],
                    fit: BoxFit.cover,
                    height: 150,
                    errorWidget: (context, url, error) => const Image(
                      image: AssetImage('images/error1.jpg'),
                      fit: BoxFit.cover,
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      strokeWidth: 5,
                      value: 30,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.productName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '\$${widget.product.productPrice}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FavoriteButton(
                          radius: 19,
                          product: widget.product,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          addItemToCart(
                            CartItem(
                              name: widget.product.productName,
                              price: widget.product.productPrice,
                              productImageUrl:
                                  widget.product.productImageUrl[0],
                            ),
                          );
                        },
                        child: const Text('Add to Cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
