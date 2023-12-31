import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyWishlistContainer extends StatelessWidget {
  const EmptyWishlistContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.square_favorites_alt,
            size: 200,
            color: Colors.grey,
          ),
          const Text(
            'Your wishlist is empty!',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'seems like you don\'t have wishes here. Make a wish!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.black,
              ),
              onPressed: () {
                Get.to(const HomePage());
              },
              child: Text(
                'Back to Shopping',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 18,
                      color: Get.isDarkMode ? Colors.white70 : Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
