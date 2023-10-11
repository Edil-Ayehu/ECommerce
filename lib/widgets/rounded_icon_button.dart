import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/services/reusable_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../models/counter_model.dart';

class RoundedIconButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundColor;
  final QueryDocumentSnapshot<Object?> productSnapshot;
  final Color iconColor;

  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.productSnapshot,
    this.iconColor = Colors.white,
  });

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addItemToCart({
    required String productId,
    required String productName,
    required double productPrice,
    required String productImageUrl,
    required String productDescription,
    required String productCategory,
    required String productSubcategory,
    required double averageRating,
    required int quantity,
  }) async {
    try {
      User? user = auth.currentUser;

      if (user != null) {
        String userId = user.uid;
        final cartItemDoc = await firestore
            .collection('users')
            .doc(userId)
            .collection('cart')
            .doc(productId)
            .get();

        if (cartItemDoc.exists) {
          ReusableFunctions.showToastMessage(
            '$productName is already in the cart.',
            Colors.red,
          );
        } else {
          context.read<CounterModel>().incrementCartItemCount();
          await firestore
              .collection('users')
              .doc(userId)
              .collection('cart')
              .doc(productId)
              .set({
            'productId': productId,
            'productName': productName,
            'productPrice': productPrice,
            'productImageUrl': productImageUrl,
            'productDescription': productDescription,
            'productCategory': productCategory,
            'productSubcategory': productSubcategory,
            'averageRating': averageRating,
            'quantity': quantity,
          });
          ReusableFunctions.showToastMessage(
            '$productName added to cart successfully.',
            Colors.black,
          );
        }
      } else {
        print('User not authenticated');
      }
    } catch (e) {
      print('Error adding item to cart: $e');
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
          if (auth.currentUser?.email != null) {
            addItemToCart(
              productId: widget.productSnapshot.id,
              productName: widget.productSnapshot['name'],
              productPrice: double.parse(
                  widget.productSnapshot['price'].toStringAsFixed(2)),
              productImageUrl: widget.productSnapshot['imageUrl'][0],
              productDescription: widget.productSnapshot['description'],
              productCategory: widget.productSnapshot['category'],
              productSubcategory: widget.productSnapshot['subcategory'],
              averageRating: double.parse(
                  widget.productSnapshot['averageRating'].toStringAsFixed(1)),
              quantity: widget.productSnapshot['quantity'],
            );
          } else {
            ReusableFunctions.showErrorDialog(
              context,
              'Please sign in or create an account to continue.',
            );
          }
        },
        child: Icon(
          widget.icon,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
