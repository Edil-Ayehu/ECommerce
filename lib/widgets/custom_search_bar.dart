import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatefulWidget {
  final Color darkModeBgColor;

  CustomSearchBar({this.darkModeBgColor = const Color(0xFF3E3E43)});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  void _clearTextField() {
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? widget.darkModeBgColor : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          hintText: 'Search for anything...',
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.grey,
          suffixIconColor: Colors.grey,
          focusColor: Colors.grey,
          suffixIcon: _controller.text.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearTextField,
                ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
                color:
                    Get.isDarkMode ? Colors.transparent : Colors.grey.shade400,
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
        ),
      ),
    );
  }
}
