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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('images/logo.jpg'),
          ),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Text(
              'EagleLion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
