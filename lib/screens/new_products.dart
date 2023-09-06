import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import '../models/products_model.dart';
import 'home_page.dart';

class AllNewArrivalProducts extends StatefulWidget {
  const AllNewArrivalProducts({Key? key}) : super(key: key);

  @override
  State<AllNewArrivalProducts> createState() => _AllNewArrivalProductsState();
}

class _AllNewArrivalProductsState extends State<AllNewArrivalProducts> {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  const Text(
                    'Sort by',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Product.products.sort((a, b) => a.productName
                          .toLowerCase()
                          .compareTo(b.productName.toLowerCase()));
                      setState(() {});
                    },
                    child: const Text('Name'),
                  ),
                  const SizedBox(width: 4),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Product.products.sort(
                          (a, b) => a.productPrice.compareTo(b.productPrice));
                      setState(() {});
                    },
                    child: const Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
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
