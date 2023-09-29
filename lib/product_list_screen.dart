import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ProductListView(),
    );
  }
}

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // Replace 'products' with your Firestore collection name
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Data has been retrieved successfully
        final products = snapshot.data!.docs;

        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            final productName = product['name'];
            final productPrice = product['price'];

            return Column(
              children: [
                Image(image: NetworkImage(product['imageUrl'][0])),
                ListTile(
                  title: Text(productName),
                  subtitle: Text('Price: \$${productPrice.toStringAsFixed(2)}'),
                  // You can customize the ListTile as needed
                ),
              ],
            );
          },
        );
      },
    );
  }
}
