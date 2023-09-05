import 'package:flutter/material.dart';

import '../models/models.dart';

class RoundedIconButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundeColor;
  final Product product;

  RoundedIconButton(
      {required this.icon,
      required this.backgroundeColor,
      required this.product});

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
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
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: widget.backgroundeColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          addItemToCart(
            CartItem(
              name: widget.product.productName,
              price: widget.product.productPrice,
              productImageUrl: widget.product.productImageUrl[0],
            ),
          );
        },
        child: Icon(
          widget.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
