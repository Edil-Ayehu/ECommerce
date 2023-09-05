import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import '../models/products_model.dart';
import 'home_page.dart';

class AllNewArrivalProducts extends StatelessWidget {
  const AllNewArrivalProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Container(
        padding: const EdgeInsets.only(
          right: 5,
          left: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          color: Colors.grey.shade200,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomSearchBar(),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ProductWidget(
                products: Product.products,
                itemCount: Product.products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
