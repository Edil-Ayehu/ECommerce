import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../models/counter_model.dart';
import '../services/reusable_functions.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // List to store wishlist items
  List<WishlistProducts> wishlistItems = [];
  //List<QueryDocumentSnapshot> wishlistItems = [];

  Future<void> fetchWishlistItems() async {
    try {
      User? user = auth.currentUser;

      if (user != null) {
        // Get the user's UID
        String userId = user.uid;

        // Reference to the user's wishlist subcollection
        CollectionReference wishlistRef =
            firestore.collection('users').doc(userId).collection('wishlist');

        // Query the wishlist subcollection to get wishlist items
        QuerySnapshot querySnapshot = await wishlistRef.get();

        // Clear the existing wishlist items
        wishlistItems.clear();

        // Iterate through the documents and add them to the list
        querySnapshot.docs.forEach((doc) {
          // Create Product object from Firestore document data
          WishlistProducts product = WishlistProducts(
            productId: doc['productId'],
            productName: doc['productName'],
            productPrice: doc['productPrice'],
            productImageUrl: doc['productImageUrl'],
            productDescription: doc['productDescription'],
          );

          // Add the product to the wishlistItems list
          wishlistItems.add(product);
        });

        // Update the UI
        setState(() {});
      } else {
        // User not authenticated
        print('User not authenticated');
      }
    } catch (e) {
      // Handle any errors that occur
      print('Error retrieving wishlist items: $e');
    }
  }

  Future<void> removeItemFromWishlist(String productId) async {
    try {
      User? user = auth.currentUser;

      if (user != null) {
        // Get the user's UID
        String userId = user.uid;

        // Reference to the user's wishlist subcollection
        CollectionReference wishlistRef =
            firestore.collection('users').doc(userId).collection('wishlist');

        await wishlistRef.doc(productId).delete();
        fetchWishlistItems();
      } else {
        // User not authenticated
        print('User not authenticated');
      }
    } catch (e) {
      // Handle any errors that occur
      print('Error removing item from wishlist: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch wishlist items when the widget is initialized
    fetchWishlistItems();
  }

  @override
  Widget build(BuildContext context) {
    final wishlistCount = wishlistItems.length;

    return Scaffold(
      backgroundColor: Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'My Favorites',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(const HomePage());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white70 : Colors.black,
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: wishlistCount == 0
          ? const EmptyWishlistContainer()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? const Color(0xFF2C2D30)
                    : Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(28),
                  topLeft: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 15),
                  //CustomSearchBar(productItems: wishlistItems),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: wishlistCount,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = wishlistItems[index];
                        return GestureDetector(
                          onTap: () {
                            //Get.to(ProductDetailsPage(product: product));
                          },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(bottom: 5),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? const Color(0xFF3E3E43)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Hero(
                                    tag: product.productId,
                                    child: Container(
                                      width: 130,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: product.productImageUrl,
                                          fit: BoxFit.cover,
                                          height: 150,
                                          errorWidget: (context, url, error) =>
                                              const Image(
                                            image:
                                                AssetImage('images/error1.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                          placeholder: (context, url) =>
                                              SpinKitCircle(
                                            color: Colors.green.shade900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product.productName,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge
                                                          ?.copyWith(
                                                            fontSize: 16,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                    ),
                                                    Text(
                                                      '\$${product.productPrice}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelLarge
                                                          ?.copyWith(
                                                            fontSize: 14,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    removeItemFromWishlist(
                                                        product.productId);
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.cancel_outlined,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Get.isDarkMode
                                                  ? const Color(0xFF2C2D30)
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 0,
                                              ),
                                              onPressed: () {
                                                //addItemToCart(product);
                                              },
                                              child: Text(
                                                'Add to Cart',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class WishlistProducts {
  final String productName;
  final String productId;
  final String productImageUrl;
  final String productDescription;
  final double productPrice;

  WishlistProducts({
    required this.productName,
    required this.productId,
    required this.productPrice,
    required this.productImageUrl,
    required this.productDescription,
  });
}
