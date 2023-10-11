import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  int _cartItemCounter = 0;
  int _wishlistItemCounter = 0;

  int get cartItemCounter => _cartItemCounter;
  int get wishlistItemCounter => _wishlistItemCounter;

  void incrementCartItemCount() {
    _cartItemCounter++;
  }

  void incrementWishlistItemCount() {
    _wishlistItemCounter++;
  }

  void decrementWishlistItemCount() {
    _wishlistItemCounter--;
  }

  Future<void> getCartItemCount() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;
        CollectionReference cartRef =
            firestore.collection('users').doc(userId).collection('cart');
        QuerySnapshot querySnapshot = await cartRef.get();
        _cartItemCounter = querySnapshot.size;
        notifyListeners(); // Notify listeners when the data is updated
      } else {
        _cartItemCounter = 0;
        notifyListeners();
      }
    } catch (e) {
      print('Error retrieving wishlist item count: $e');
      _cartItemCounter = 0;
      notifyListeners();
    }
  }

  Future<void> getWishlistItemCount() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String userId = user.uid;
        CollectionReference wishlistRef =
            firestore.collection('users').doc(userId).collection('wishlist');
        QuerySnapshot querySnapshot = await wishlistRef.get();
        _wishlistItemCounter = querySnapshot.size;
        notifyListeners();
      } else {
        _wishlistItemCounter = 0;
        notifyListeners();
      }
    } catch (e) {
      print('Error retrieving wishlist item count: $e');
      _wishlistItemCounter = 0;
      notifyListeners();
    }
  }
}
