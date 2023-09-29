import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RoundedIconButton extends StatefulWidget {
  final IconData icon;
  final Color backgroundColor;
  final QueryDocumentSnapshot<Object?> productSnapshot;

  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.productSnapshot,
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
        // Get the user's UID
        String userId = user.uid;

        // Check if the item is already in the user's cart
        final cartItemDoc = await firestore
            .collection('users')
            .doc(userId)
            .collection('cart')
            .doc(productId)
            .get();

        if (cartItemDoc.exists) {
          // The item is already in the cart
          showToastMessage('$productName is already in the cart', Colors.red);
        } else {
          // Add the product to the user's cart
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
            // Add other product details as needed
          });

          // Cart item added successfully
          showToastMessage(
              '$productName added to cart successfully.', Colors.black);
        }
      } else {
        // User not authenticated
        print('User not authenticated');
      }
    } catch (e) {
      // Handle any errors that occur
      print('Error adding item to cart: $e');
    }
  }

  // Function to show a toast message
  void showToastMessage(String message, Color bgColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: bgColor,
    );
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
            showErrorDialog(
                context, 'Please sign in or create an account to continue.');
          }
        },
        child: Icon(
          widget.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
