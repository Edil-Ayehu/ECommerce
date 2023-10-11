import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:e_commerce_project/services/reusable_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter_model.dart';

class FavoriteButton extends StatefulWidget {
  final double radius;
  final Color bgColor;
  final Product? product;
  final QueryDocumentSnapshot<Object?>? productSnapshot;

  const FavoriteButton({
    Key? key,
    this.radius = 20,
    this.bgColor = Colors.white,
    this.product,
    this.productSnapshot,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();

    checkIfFavorite();
  }

  Future<void> checkIfFavorite() async {
    User? user = auth.currentUser;

    if (user != null) {
      // Get the user's UID
      String userId = user.uid;

      // Check if the product exists in the user's wishlist
      DocumentSnapshot documentSnapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('wishlist')
          .doc(widget.productSnapshot!.id)
          .get();

      setState(() {
        isFavorite = documentSnapshot.exists;
      });
    }
  }

  Future<void> toggleWishlistStatus() async {
    User? user = auth.currentUser;

    if (user != null) {
      String userId = user.uid;

      if (isFavorite) {
        // If the item is in the wishlist, remove it
        context.read<CounterModel>().decrementWishlistItemCount();
        await firestore
            .collection('users')
            .doc(userId)
            .collection('wishlist')
            .doc(widget.productSnapshot!.id)
            .delete();
      } else {
        // If the item is not in the wishlist, add it
        context.read<CounterModel>().incrementWishlistItemCount();
        await firestore
            .collection('users')
            .doc(userId)
            .collection('wishlist')
            .doc(widget.productSnapshot!.id)
            .set({
          'productId': widget.productSnapshot!.id,
          'productName': widget.productSnapshot!['name'],
          'productPrice':
              double.parse(widget.productSnapshot?['price'].toStringAsFixed(2)),
          'productDescription': widget.productSnapshot?['description'],
          'productCategory': widget.productSnapshot?['category'],
          'productSubcategory': widget.productSnapshot?['subcategory'],
          'averageRating': double.parse(
              widget.productSnapshot?['averageRating'].toStringAsFixed(2)),
          'productImageUrl': widget.productSnapshot?['imageUrl'][0],
        });
      }

      setState(() {
        isFavorite = !isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.bgColor,
      radius: widget.radius,
      child: Center(
        child: IconButton(
          onPressed: () {
            if (auth.currentUser?.email != null) {
              toggleWishlistStatus();
            } else {
              ReusableFunctions.showErrorDialog(
                context,
                "Please sign in or create an account to continue.",
              );
            }
          },
          icon: Icon(
            Icons.favorite,
            color: isFavorite ? Colors.red : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
