import 'package:flutter/material.dart';

class NotificationAvatar extends StatefulWidget {
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
  State<NotificationAvatar> createState() => _NotificationAvatarState();
}

class _NotificationAvatarState extends State<NotificationAvatar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: widget.bgColor,
          child: Icon(
            widget.icon,
            color: widget.iconColor,
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
              '${widget.counter}',
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
