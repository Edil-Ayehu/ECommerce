import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 55,
      backgroundColor: Color(0xFF750F21),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 75,
      ),
    );
  }
}
