import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/screens.dart';

class EmptyCartContainer extends StatelessWidget {
  const EmptyCartContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('images/emptycart.png'),
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          const Text(
            'Your cart is currently empty!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'you must add some items to the cart before you proceed to checkout',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
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
                'Back to Shop',
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
