import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalTextContainer extends StatelessWidget {
  final Function() onTap;
  final String titleText;

  const HorizontalTextContainer(
      {super.key, required this.onTap, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'More',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white70 : Colors.green.shade900,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
