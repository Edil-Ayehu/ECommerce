import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
              Get.to(SigninScreen());
            }
          },
          icon: Icon(
            Icons.favorite,
            color: widget.product.isFavorite
                ? Colors.red.shade300
                : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
