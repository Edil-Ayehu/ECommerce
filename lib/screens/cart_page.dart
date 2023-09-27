import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _auth = FirebaseAuth.instance;

  double taxRate = 0.15; // 15% tax rate

  @override
  Widget build(BuildContext context) {
    double subtotal = 0.0;
    double tax = 0.0;

    // Calculate subtotal and tax
    for (var item in widget.cartItems) {
      subtotal += item.productPrice * item.quantity;
    }
    tax = subtotal * taxRate;
    double total = subtotal + tax;

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

    return Scaffold(
      backgroundColor: Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Cart',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          NotificationAvatar(
            counter: widget.cartItems.length,
            icon: Icons.shopping_cart,
            bgColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: widget.cartItems.isEmpty
          ? const EmptyCartContainer()
          : Container(
              padding: const EdgeInsets.only(right: 3, left: 3, top: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                color: Get.isDarkMode
                    ? const Color(0xFF2C2D30)
                    : Colors.grey.shade200,
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListView.builder(
                  itemCount: widget.cartItems.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final cartItem = widget.cartItems[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(ProductDetailsPage(product: cartItem));
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
                              Expanded(
                                flex: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: cartItem.productImageUrl[0],
                                    fit: BoxFit.cover,
                                    height: 100,
                                    errorWidget: (context, url, error) =>
                                        const Image(
                                      image: AssetImage('images/error1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                    placeholder: (context, url) =>
                                        SpinKitCircle(
                                      color: Colors.green.shade900,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItem.productName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(fontSize: 16),
                                            ),
                                            Text(
                                              '\$${cartItem.productPrice.toStringAsFixed(2)}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              widget.cartItems.removeAt(index);
                                              Fluttertoast.showToast(
                                                msg:
                                                    "${cartItem.productName} removed from the cart successfully!",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                backgroundColor: Colors.black,
                                              );
                                            });
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Get.isDarkMode
                                                ? const Color(0xFF2C2D30)
                                                : Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(28),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  color: Get.isDarkMode
                                                      ? Colors.white70
                                                      : Colors.black,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    if (widget.cartItems[index]
                                                            .quantity >
                                                        1) {
                                                      widget.cartItems[index]
                                                          .quantity--;
                                                    }
                                                  });
                                                },
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                '${cartItem.quantity}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                              ),
                                              const SizedBox(width: 10),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  color: Get.isDarkMode
                                                      ? Colors.white70
                                                      : Colors.black,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    widget.cartItems[index]
                                                        .quantity++;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        //const SizedBox(width: 10),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
      bottomNavigationBar: Visibility(
        visible: widget.cartItems.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Subtotal:',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\$${subtotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax (${(taxRate * 100).toStringAsFixed(0)}%):',
                    style: const TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\$${tax.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                      color:
                          Get.isDarkMode ? Colors.white : Colors.green.shade900,
                    ),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                      color:
                          Get.isDarkMode ? Colors.white : Colors.green.shade900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Get.isDarkMode ? Colors.white70 : Colors.black,
                  ),
                  onPressed: () {
                    if (_auth.currentUser?.email != null) {
                      Get.to(const CheckoutScreen());
                    } else {
                      showErrorDialog(context,
                          'Please sign in or create an account to continue.');
                    }
                  },
                  child: Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 20,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
