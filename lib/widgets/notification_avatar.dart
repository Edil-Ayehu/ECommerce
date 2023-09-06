import 'package:flutter/material.dart';

class NotificationAvatar extends StatelessWidget {
  final int counter;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const NotificationAvatar({
    super.key,
    required this.counter,
    required this.icon,
    this.bgColor = Colors.white,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: bgColor,
          child: Icon(
            icon,
            color: iconColor,
            size: 28,
          ),
        ),
        Positioned(
          top: 1,
          right: 2,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: Colors.red, // Change the badge background color as needed
              shape: BoxShape.circle,
            ),
            child: Text(
              '$counter',
              style: const TextStyle(
                color: Colors.white, // Change the badge text color as needed
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
