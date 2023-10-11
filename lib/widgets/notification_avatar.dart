import 'package:e_commerce_project/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationAvatar extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final bool isWishlistCounter;

  const NotificationAvatar({
    super.key,
    required this.icon,
    this.bgColor = Colors.white,
    this.iconColor = Colors.black,
    this.isWishlistCounter = false,
  });

  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<CounterModel>(context, listen: false);

    isWishlistCounter
        ? myModel.getCartItemCount()
        : myModel.getWishlistItemCount();

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
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Text(
              isWishlistCounter
                  ? '${Provider.of<CounterModel>(context).wishlistItemCounter}'
                  : '${Provider.of<CounterModel>(context).cartItemCounter}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
