import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:flutter/material.dart';
import '../screens/product_details_page.dart';

class ProductWidget extends StatefulWidget {
  final List<Product> products;
  final int itemCount;

  const ProductWidget({
    super.key,
    required this.products,
    this.itemCount = 0,
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
        itemCount: (widget.itemCount > widget.products.length)
            ? widget.products.length
            : widget.itemCount,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 240,
          crossAxisSpacing: 3,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    product: widget.products[index],
                  ),
                ),
              );
            },
            child: VerticalProductContainer(
              product: widget.products[index],
            ),
          );
        },
      ),
    );
  }
}
