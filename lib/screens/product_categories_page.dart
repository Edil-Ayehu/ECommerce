import 'package:e_commerce_project/models/models.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoriesPage extends StatefulWidget {
  final List<Category> categories;
  const ProductCategoriesPage({super.key, required this.categories});

  @override
  _ProductCategoriesPageState createState() => _ProductCategoriesPageState();
}

class _ProductCategoriesPageState extends State<ProductCategoriesPage> {
  String? selectedCategory;
  String? selectedSubcategory;

  void _showSubcategoriesDialog(List<String>? subcategories) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Select a Subcategory',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(height: 20.0),
                    DropdownButton<String>(
                      iconSize: 32,
                      hint: Text(
                        'Select a subcategory',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      dropdownColor: Colors.grey.shade400,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      icon: Icon(
                        Icons.arrow_downward,
                        color: Colors.green.shade900,
                      ),
                      value: selectedSubcategory,
                      enableFeedback: true,
                      onChanged: (newValue) {
                        setState(() {
                          selectedSubcategory = newValue;
                        });
                      },
                      items: subcategories?.map((subcategory) {
                        return DropdownMenuItem<String>(
                          value: subcategory,
                          child: Text(subcategory),
                        );
                      }).toList(),
                      selectedItemBuilder: (BuildContext context) =>
                          subcategories!
                              .map<Widget>((e) => Center(
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.amber,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))
                              .toList(),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900),
                      onPressed: () {
                        selectedSubcategory != null
                            ? {
                                Navigator.of(context).pop(),
                                Get.to(ProductsPage(
                                    products: Product.products
                                        .where((product) =>
                                            product.productSubCategory ==
                                            selectedSubcategory)
                                        .toList())),
                              }
                            : Navigator.of(context).pop();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 2,
        title: Text(
          'Product Categories',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Select a Category:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 80,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: widget.categories.length,
                itemBuilder: (context, index) {
                  final category = widget.categories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category.name;
                        selectedSubcategory =
                            null; // Clear subcategory selection
                      });
                      category.subCategories.isNotEmpty
                          ? _showSubcategoriesDialog(category.subCategories)
                          : Get.to(ProductsPage(
                              products: Product.products
                                  .where((product) =>
                                      product.productCategory == category.name)
                                  .toList(),
                            ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedCategory == category.name
                              ? Colors.green.shade900
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        category.name,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: 18,
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
