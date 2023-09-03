import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;

  CategoryWidget({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: 120,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          //border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Text(
          categoryName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
