import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import '../models/products_model.dart';
import 'home_page.dart';

class NewProductsPage extends StatefulWidget {
  const NewProductsPage({Key? key}) : super(key: key);

  @override
  State<NewProductsPage> createState() => _NewProductsPageState();
}

class _NewProductsPageState extends State<NewProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'New Products',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Get.to(const HomePage());
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        foregroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          color:
              Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.grey.shade200,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomSearchBar(darkModeBgColor: const Color(0xFF3E3E43)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text(
                    'Sort by',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Get.isDarkMode ? Colors.white70 : Colors.black,
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
                    child: Text(
                      'Name',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            color:
                                Get.isDarkMode ? Colors.white70 : Colors.white,
                          ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Get.isDarkMode ? Colors.white70 : Colors.white,
                    ),
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
