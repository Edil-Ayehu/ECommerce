import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/themes/themes.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: const Image(
                image: AssetImage('images/logo.jpg'),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.isDarkMode
                  ? Get.changeTheme(lightTheme)
                  : Get.changeTheme(darkTheme);
            },
            child: const ListTile(
              leading: Text(
                'Light/Dark mode',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.lightbulb_circle,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Get.to(CartPage(cartItems: CartItem.cartItems));
            },
            child: const ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: Text(
                'Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                'Setting',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(const AboutPage());
            },
            child: const ListTile(
              leading: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
              title: Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          (_auth.currentUser?.email == null)
              ? InkWell(
                  onTap: () {
                    Get.to(SigninScreen());
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    _auth.signOut();
                    Get.to(SigninScreen());
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
