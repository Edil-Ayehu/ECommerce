import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/models.dart';

class RoundedIconButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundeColor;
  final Product product;

  const RoundedIconButton(
      {super.key,
      required this.icon,
      required this.backgroundeColor,
      required this.product});

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  addItemToCart(CartItem newItem) {
    bool itemExists = CartItem.cartItems.any((item) => item.id == newItem.id);
    if (itemExists) {
      Fluttertoast.showToast(
        msg: "${newItem.name} is already in the cart!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    } else {
      CartItem.cartItems.add(newItem);
      Fluttertoast.showToast(
        msg: "${newItem.name} added to the cart successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black,
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
              id: widget.product.productId,
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
