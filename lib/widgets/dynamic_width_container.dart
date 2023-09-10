import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DynamicWidthContainer extends StatelessWidget {
  final String text;

  DynamicWidthContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
            color: Get.isDarkMode ? Colors.transparent : Colors.grey.shade300,
            width: 1),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
