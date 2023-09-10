import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/models.dart';

class RoundedIconButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundColor;
  final Product product;

  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.product,
  });

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  addItemToCart(Product newItem) {
    bool itemExists =
        CartItem.cartItems.any((item) => item.productId == newItem.productId);
    if (itemExists) {
      Fluttertoast.showToast(
        msg: "${newItem.productName} is already in the cart!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    } else {
      CartItem.cartItems.add(newItem);
      Fluttertoast.showToast(
        msg: "${newItem.productName} added to the cart successfully!",
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
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          addItemToCart(widget.product);
        },
        child: Icon(
          widget.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
