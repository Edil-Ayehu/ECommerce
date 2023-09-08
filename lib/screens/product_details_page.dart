import 'package:e_commerce_project/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/products_model.dart';
import 'package:share/share.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _selectedImageIndex = 0;

  void shareProduct(BuildContext context, String productTitle,
      String productDescription, String productImgUrl) {
    Share.share(
      '$productTitle\n$productDescription\n$productImgUrl',
      subject: 'Check out this product!',
    );
  }

  addItemToCart(CartItem newItem) {
    bool itemExists = CartItem.cartItems.any((item) => item.id == newItem.id);
    if (itemExists) {
      Fluttertoast.showToast(
        msg: "${newItem.name} is already in the cart!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    } else {
      CartItem.cartItems.add(newItem);
      Fluttertoast.showToast(
        msg: "${newItem.name} added to the cart successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 2,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Product details',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () => shareProduct(
                context,
                widget.product.productName,
                widget.product.productDescription,
                widget.product.productImageUrl[0],
              ),
              icon: const Icon(Icons.share, color: Colors.black),
            ),
          ),
          const SizedBox(width: 5),
          FavoriteButton(
            radius: 23,
            product: widget.product,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
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
                  padding: const EdgeInsets.all(8.0),
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.productName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '\$${widget.product.productPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
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
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
                        child: const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 20,
                            ),
                            Text(
                              '4.3 (130 Reviews)',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
                    style: const TextStyle(
                      letterSpacing: 1.2,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              addItemToCart(
                                CartItem(
                                  id: widget.product.productId,
                                  name: widget.product.productName,
                                  price: widget.product.productPrice,
                                  productImageUrl:
                                      widget.product.productImageUrl[0],
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart,
                                color: Colors.white),
                            label: const Text(
                              'Add to Cart',
                              style: TextStyle(),
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
                              backgroundColor: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
