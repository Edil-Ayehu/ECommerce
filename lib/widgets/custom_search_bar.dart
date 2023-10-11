import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/screens.dart';

class CustomSearchBar extends StatefulWidget {
  final List<QueryDocumentSnapshot> productItems;
  final Color darkModeBgColor;

  const CustomSearchBar({
    super.key,
    this.darkModeBgColor = const Color(0xFF3E3E43),
    required this.productItems,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  List<QueryDocumentSnapshot> filteredItems = [];

  void _clearTextField() {
    _controller.clear();
    setState(() {
      filteredItems.clear();
    });
  }

  void _onTextChanged(String value) {
    setState(() {
      filteredItems = widget.productItems
          .where(
            (item) =>
                item['name'].toLowerCase().contains(value.toLowerCase().trim()),
          )
          .toList();
    });
  }

  void _navigateToProductDetails(String productName) {
    QueryDocumentSnapshot selected = widget.productItems
        .firstWhere((element) => element['name'] == productName);
    Get.to(ProductDetailsPage(productSnapshot: selected));
    // Clear the search results and text field
    _controller.clear();
    setState(() {
      filteredItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? widget.darkModeBgColor : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: _onTextChanged,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              hintText: 'search'.tr,
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
                  color: Get.isDarkMode
                      ? Colors.transparent
                      : Colors.grey.shade400,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(
                  color: Get.isDarkMode
                      ? Colors.transparent
                      : Colors.grey.shade400,
                  width: 1,
                ),
              ),
            ),
          ),
          if (filteredItems.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode ? widget.darkModeBgColor : Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true, // Adjust height based on content
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final productName = filteredItems[index]['name'];
                  return ListTile(
                    title: Text(productName),
                    onTap: () {
                      _navigateToProductDetails(productName);
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
