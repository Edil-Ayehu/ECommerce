import 'package:e_commerce_project/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final _auth = FirebaseAuth.instance;
  int _selectedImageIndex = 0;

  double userRating = 0; // Store user's rating
  bool userTouchedRating = false;
  bool hasUserSubmittedReview = false;

  @override
  void initState() {
    super.initState();

    userRating = 0; // Load the user's rating
  }

  void shareProduct(BuildContext context, String productTitle,
      String productDescription, String productImgUrl) {
    Share.share(
      '$productTitle\n$productDescription\n$productImgUrl',
      subject: 'Check out this product!',
    );
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

  void _showRatingDialog() {
    if (!hasUserSubmittedReview) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return RatingDialog(
            starSize: 25,
            title: const Text("Rate and Review"),
            message: const Text("Please rate and review this product"),
            submitButtonText: 'Submit',
            initialRating: userRating, // Pass the user's rating here
            onSubmitted: (RatingDialogResponse response) {
              if (response != null && response.rating != null) {
                setState(() {
                  userRating = response.rating;
                  widget.product.averageRating =
                      (widget.product.averageRating + userRating) / 2;
                  userTouchedRating = true;
                  hasUserSubmittedReview = true; // Set the flag to true
                });

                // You can store the user's rating and review in a database or elsewhere here
                print("Rating: $userRating, Review: ${response.comment}");
              }
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> relatedProducts = Product.products
        .where((e) => e.productSubCategory == widget.product.productSubCategory)
        .toList();
    relatedProducts.remove(widget.product);
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.white70 : Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor:
            Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.grey.shade200,
        elevation: Get.isDarkMode ? 0 : 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white70 : Colors.black,
          ),
        ),
        title: Text(
          'Product details',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          CircleAvatar(
            radius: 23,
            backgroundColor:
                Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.white,
            child: IconButton(
              onPressed: () => shareProduct(
                context,
                widget.product.productName,
                widget.product.productDescription,
                widget.product.productImageUrl[0],
              ),
              icon: Icon(
                Icons.share,
                color: Get.isDarkMode ? Colors.white70 : Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 5),
          FavoriteButton(
            radius: 23,
            product: widget.product,
            bgColor: Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.white,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Large Product Image
            SizedBox(
              height: 300,
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: widget.product.productImageUrl[_selectedImageIndex],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage('images/error1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  placeholder: (context, url) => SpinKitCircle(
                    color: Colors.green.shade900,
                  ),
                ),
              ),
            ),

            // Small Product Images (PageView)
            SizedBox(
              height: 85,
              child: PageView.builder(
                itemCount: widget.product.productImageUrl.length,
                controller: PageController(viewportFraction: 0.2),
                onPageChanged: (index) {
                  setState(() {
                    _selectedImageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImageIndex = index;
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: widget.product.productImageUrl[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage('images/error1.jpg'),
                            fit: BoxFit.cover,
                          ),
                          placeholder: (context, url) => SpinKitCircle(
                            color: Colors.green.shade900,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Product Name and Description Part
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.productName,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      Text('\$${widget.product.productPrice}',
                          style: Theme.of(context).textTheme.displayMedium),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Visibility(
                        visible: widget.product.amount <= 5,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          child: Text(
                            'Only ${widget.product.amount} Left',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),

                        // Rating section ************************
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1.0),
                          child: (_auth.currentUser?.email != null)
                              ? Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating:
                                          widget.product.averageRating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20, // Adjust the size as needed
                                      ignoreGestures:
                                          hasUserSubmittedReview, // Disable rating update if review submitted
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        if (!hasUserSubmittedReview) {
                                          _showRatingDialog();
                                        }
                                      },
                                    ),
                                    Text(
                                      '( ${widget.product.averageRating.toStringAsFixed(1)}) ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              : InkWell(
                                  onTap: () {
                                    Get.off(SigninScreen());
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 20),
                                      const SizedBox(width: 5),
                                      Text(
                                        widget.product.averageRating
                                            .toStringAsFixed(1),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),

                        // Rating section ************************
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.product.productDescription,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Get.isDarkMode
                                  ? const Color(0xFF2C2D30)
                                  : Colors.black,
                              side: BorderSide(
                                color: Get.isDarkMode
                                    ? Colors.white70
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              addItemToCart(widget.product);
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Get.isDarkMode
                                  ? Colors.white70
                                  : Colors.white,
                            ),
                            label: Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white70
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              //backgroundColor: Colors.green.shade900,
                              side: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              backgroundColor: Get.isDarkMode
                                  ? Colors.white70
                                  : Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFF2C2D30),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              child: const Divider(),
            ),
            // Related Products
            relatedProducts.isNotEmpty
                ? Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    color:
                        Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 15,
                            top: 10,
                          ),
                          child: Text(
                            'Related Products',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        ProductWidget(
                          products: relatedProducts,
                          itemCount: relatedProducts.length,
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
