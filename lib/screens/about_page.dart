import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/company_logo.png', // Replace with your company logo image path
              width: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Our Company Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'About our Company and Mission...',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Meet Our Team',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Team members' photos and names
            // Example: ListTile leading: CircleAvatar(), title: Text('John Doe')
            // Repeat for each team member
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/team_member1.jpg'),
              ),
              title: Text('John Doe'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/team_member2.jpg'),
              ),
              title: Text('Jane Smith'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Customer Reviews',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Customer reviews or testimonials
            // Example: ListTile title: Text('Great app! Highly recommended.')
            // Repeat for each review
            const ListTile(
              title: Text('Great app! Highly recommended.'),
            ),
            const ListTile(
              title: Text('Excellent service and fast delivery.'),
            ),
            // Add more sections for FAQs, contact information, and other details
          ],
        ),
      ),
    );
  }
}
