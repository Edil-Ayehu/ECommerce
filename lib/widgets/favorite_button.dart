// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_project/models/models.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FavoriteButton extends StatefulWidget {
//   final double radius;
//   final Color bgColor;
//   final Product? product;
//   final QueryDocumentSnapshot<Object?>? productSnapshot;
//
//   const FavoriteButton({
//     super.key,
//     this.radius = 20,
//     this.bgColor = Colors.white,
//     this.product,
//     this.productSnapshot,
//   });
//
//   @override
//   State<FavoriteButton> createState() => _FavoriteButtonState();
// }
//
// class _FavoriteButtonState extends State<FavoriteButton> {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   Future<void> addToWishlist({
//     required String productId,
//     required String productName,
//     required double productPrice,
//     required String productImageUrl,
//     required String productDescription,
//     required String productCategory,
//     required String productSubcategory,
//     required double averageRating,
//   }) async {
//     try {
//       User? user = auth.currentUser;
//
//       if (user != null) {
//         // Get the user's UID
//         String userId = user.uid;
//
//         // Add the product to the user's wishlist
//         await firestore
//             .collection('users')
//             .doc(userId)
//             .collection('wishlist')
//             .doc(productId)
//             .set({
//           'productId': productId,
//           'productName': productName,
//           'productPrice': productPrice,
//           'productImageUrl': productImageUrl,
//           'productDescription': productDescription,
//           'productCategory': productCategory,
//           'productSubcategory': productSubcategory,
//           'averageRating': averageRating,
//           // Add other product details as needed
//         });
//
//         // Wishlist item added successfully
//         print('Product added to wishlist');
//       } else {
//         // User not authenticated
//         print('User not authenticated');
//       }
//     } catch (e) {
//       // Handle any errors that occur
//       print('Error adding product to wishlist: $e');
//     }
//   }
//
//   void showErrorDialog(ctx, String errorMessage) {
//     showCupertinoDialog(
//         context: ctx,
//         builder: (_) => CupertinoAlertDialog(
//               title: const Text("Error"),
//               content: Text(errorMessage),
//               actions: [
//                 CupertinoButton(
//                   child: const Text(
//                     'OK',
//                     style: TextStyle(
//                       color: Color(0xFF750F21),
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.of(ctx).pop();
//                   },
//                 )
//               ],
//             ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       backgroundColor: widget.bgColor,
//       radius: widget.radius,
//       child: Center(
//         child: IconButton(
//           onPressed: () {
//             if (auth.currentUser?.email != null) {
//               addToWishlist(
//                 productId: widget.productSnapshot!.id,
//                 productName: widget.productSnapshot?['name'],
//                 // productPrice: widget.productSnapshot?['price'],
//                 productPrice: 45,
//                 productImageUrl: widget.productSnapshot?['imageUrl'][0],
//                 productDescription: widget.productSnapshot?['description'],
//                 productCategory: widget.productSnapshot?['category'],
//                 productSubcategory: widget.productSnapshot?['subcategory'],
//                 averageRating: widget.productSnapshot?['averageRating'],
//               );
//             } else {
//               showErrorDialog(
//                   context, 'Please sign in or create an account to continue.');
//             }
//           },
//           icon: Icon(
//             Icons.favorite,
//             color: Colors.grey.shade400,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  bool isFavorite = false; // Whether the item is in the wishlist

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
      // Get the user's UID
      String userId = user.uid;

      if (isFavorite) {
        // If the item is in the wishlist, remove it
        await firestore
            .collection('users')
            .doc(userId)
            .collection('wishlist')
            .doc(widget.productSnapshot!.id)
            .delete();
      } else {
        // If the item is not in the wishlist, add it
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
          // Add other product details as needed
        });
      }

      setState(() {
        isFavorite = !isFavorite;
      });
    }
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
            if (auth.currentUser?.email != null) {
              toggleWishlistStatus();
            } else {
              showErrorDialog(
                context,
                'Please sign in or create an account to continue.',
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
