import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:flutter/material.dart';
import '../screens/product_details_page.dart';

class ProductWidget extends StatefulWidget {
  final int itemCount;
  final List<QueryDocumentSnapshot> products;

  const ProductWidget({
    super.key,
    this.itemCount = 0,
    required this.products,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 4),
        // itemCount: (widget.itemCount > widget.products.length)
        //     ? widget.products.length
        //     : widget.itemCount,
        itemCount: widget.products.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240,
          crossAxisSpacing: 3,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = widget.products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productSnapshot: product,
                  ),
                ),
              );
            },
            child: VerticalProductContainer(
              productSnapshot: product,
            ),
          );
        },
      ),
    );
  }
}
