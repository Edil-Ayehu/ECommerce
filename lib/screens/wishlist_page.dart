import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {});
  }

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

  void addItemToWishlist(Product newItem) {
    WishlistItem.wishlistItems.add(newItem);
  }

  void removeItemFromWishlist(Product newItem) {
    WishlistItem.wishlistItems.remove(newItem);
  }

  @override
  Widget build(BuildContext context) {
    // final favoriteProducts = Product.products.where((element) => element.isFavorite).toList();
    final favoriteProducts = WishlistItem.wishlistItems;

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        backgroundColor:
            Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
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
        body: favoriteProducts.isEmpty
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
                    favoriteProducts.isEmpty ? Container() : CustomSearchBar(),
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: favoriteProducts.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(ProductDetailsPage(product: product));
                            },
                            child: Card(
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 120,
                                //padding: const EdgeInsets.all(6),
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
                                        height: 120,
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
                                            imageUrl:
                                                product.productImageUrl[0],
                                            fit: BoxFit.cover,
                                            height: 150,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Image(
                                              image: AssetImage(
                                                  'images/error1.jpg'),
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
                                          vertical: 6,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        product.productName,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelLarge
                                                            ?.copyWith(
                                                              fontSize: 18,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                      ),
                                                      Text(
                                                        '\$${product.productPrice}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Card(
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              26)),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Get.isDarkMode
                                                            ? const Color(
                                                                0xFF2C2D30)
                                                            : Colors.white,
                                                    radius: 19,
                                                    child: Center(
                                                      child: IconButton(
                                                        onPressed: () {
                                                          bool itemExists = WishlistItem
                                                              .wishlistItems
                                                              .any((item) =>
                                                                  item.productId ==
                                                                  product
                                                                      .productId);
                                                          setState(() {
                                                            product.isFavorite =
                                                                !product
                                                                    .isFavorite;
                                                            if (itemExists) {
                                                              removeItemFromWishlist(
                                                                  product);
                                                            } else {
                                                              addItemToWishlist(
                                                                  product);
                                                            }
                                                          });
                                                        },
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          color:
                                                              product.isFavorite
                                                                  ? Colors.red
                                                                      .shade300
                                                                  : Colors.grey
                                                                      .shade400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 45,
                                              width: double.infinity,
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
                                                  addItemToCart(product);
                                                },
                                                child: Text(
                                                  'Add to Cart',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
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
      ),
    );
  }
}
