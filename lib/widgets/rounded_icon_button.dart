import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundeColor;

  RoundedIconButton({required this.icon, required this.backgroundeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundeColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
