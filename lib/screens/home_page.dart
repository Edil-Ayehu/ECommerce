import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens.dart';
import '../widgets/widgets.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _advertisement = [
    {"title": "Advertisement 1", "url": "images/add1.jpg"},
    {"title": "Advertisement 2", "url": "images/add2.jpg"},
  ];

  final List<String> _categoryList = [
    'Electronics',
    'Food',
    'Clothings',
    'Furniture',
    'Stationary',
    'Shoes'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DrawerHeader(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: const Image(
                    image: AssetImage('images/logo.jpg'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                title: Text(
                  'Notifications',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  'Setting',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Spacer(),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          height: 50,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(HomePage());
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.category,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(WishlistPage());
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10.0, right: 10.0),
        child: Column(
          children: [
            const CustomSearchBar(),
            const SizedBox(height: 20),
            SizedBox(
              height: 45,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryWidget(categoryName: _categoryList[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              items: _advertisement.map(
                (item) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GridTile(
                      child: Image(
                        image: AssetImage(item['url']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                aspectRatio: 2,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeFactor: 1,
                height: 140,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 15, top: 20, bottom: 20),
              // margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Arrivals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const AllNewArrivalProducts());
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ProductWidget(
              products: Product.products,
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}
