import 'package:flutter/material.dart';

import '../models/products_model.dart';

class FavoriteButton extends StatefulWidget {
  final double radius;
  final Color bgColor;
  final Product product;

  FavoriteButton({
    this.radius = 20,
    this.bgColor = Colors.white,
    required this.product,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      child: CircleAvatar(
        backgroundColor: widget.bgColor,
        radius: widget.radius,
        child: Center(
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.product.isFavorite = !widget.product.isFavorite;
              });
            },
            icon: Icon(
              Icons.favorite,
              color: widget.product.isFavorite
                  ? Colors.red.shade300
                  : Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
