import 'dart:async';
import 'package:get/get.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Get.off(const HomePage()));
    return Scaffold(
      backgroundColor: const Color(0xFF750F21),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 170,
            ),
          ),
          const Text(
            'Gulit Daily',
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              'Fashion, Tech, Home, and More – All in the Palm of Your Hand',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
