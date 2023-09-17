import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Product list (You can replace this with a ListView.builder)
            const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Product 1'),
              trailing: Text('\$10.00'),
            ),
            const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Product 2'),
              trailing: Text('\$15.00'),
            ),
            const ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Product 3'),
              trailing: Text('\$20.00'),
            ),
            const Divider(),
            // Total price
            const ListTile(
              title: Text('Total:'),
              trailing: Text('\$45.00',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            // Shipping address
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('John Doe'),
            const Text('123 Shipping St'),
            const Text('City, State ZIP'),
            const SizedBox(height: 16),
            // Payment button
            ElevatedButton(
              onPressed: () {
                // Implement payment processing logic here
              },
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
