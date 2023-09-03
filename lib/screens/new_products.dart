import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import '../models/products.dart';
import 'home_page.dart';

class AllNewArrivalProducts extends StatelessWidget {
  const AllNewArrivalProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 2,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'New Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Get.to(const HomePage());
            },
            icon: const Icon(Icons.arrow_back)),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomSearchBar(),
          ),
          const SizedBox(height: 10),
          ProductWidget(
            products: Product.products,
            itemCount: Product.products.length,
          ),
        ],
      ),
    );
  }
}
