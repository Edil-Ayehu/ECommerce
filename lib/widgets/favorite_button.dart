import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteButton extends StatefulWidget {
  final double radius;
  final Color bgColor;
  final Product product;

  const FavoriteButton({
    super.key,
    this.radius = 20,
    this.bgColor = Colors.white,
    required this.product,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final _auth = FirebaseAuth.instance;

  void addItemToWishlist(Product newItem) {
    WishlistItem.wishlistItems.add(newItem);
  }

  void removeItemFromWishlist(Product newItem) {
    WishlistItem.wishlistItems.remove(newItem);
  }

  void showErrorDialog(ctx, String errorMessage) {
    showCupertinoDialog(
        context: ctx,
        builder: (_) => CupertinoAlertDialog(
              title: const Text("Error"),
              content: Text(errorMessage),
              actions: [
                CupertinoButton(
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Color(0xFF750F21),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.bgColor,
      radius: widget.radius,
      child: Center(
        child: IconButton(
          onPressed: () {
            if (_auth.currentUser?.email != null) {
              bool itemExists = WishlistItem.wishlistItems
                  .any((item) => item.productId == widget.product.productId);
              setState(() {
                widget.product.isFavorite = !widget.product.isFavorite;
                if (itemExists) {
                  removeItemFromWishlist(widget.product);
                } else {
                  addItemToWishlist(widget.product);
                }
              });
            } else {
              showErrorDialog(
                  context, 'Please sign in or create an account to continue.');
            }
          },
          icon: Icon(
            Icons.favorite,
            color:
                widget.product.isFavorite ? Colors.red : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
