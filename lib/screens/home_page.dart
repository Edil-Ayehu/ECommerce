import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/models/category_model.dart';
import 'package:e_commerce_project/models/products_model.dart';
import 'package:e_commerce_project/screens/products_page.dart';
import 'package:e_commerce_project/widgets/horizontal_text_container.dart';
import 'package:e_commerce_project/widgets/notification_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/models.dart';
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

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(WishlistPage());
                    setState(() {});
                  },
                  child: NotificationAvatar(
                    counter: Product.products
                        .where((element) => element.isFavorite)
                        .toList()
                        .length,
                    icon: Icons.favorite,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Get.to(CartPage(cartItems: CartItem.cartItems));
                    setState(() {});
                  },
                  child: NotificationAvatar(
                    counter: CartItem.cartItems.length,
                    icon: Icons.shopping_cart,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
        drawer: Drawer(
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
                onTap: () {},
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
                onTap: () {},
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
              InkWell(
                onTap: () {},
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
                  onPressed: () {
                    Get.to(
                        ProductCategoriesPage(categories: Category.categories));
                  },
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomSearchBar(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: HorizontalTextContainer(
                  onTap: () {
                    Get.to(
                        ProductCategoriesPage(categories: Category.categories));
                  },
                  titleText: 'Categories',
                ),
              ),
              SizedBox(
                height: 45,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: Category.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = Category.categories[index];
                    return InkWell(
                      onTap: () {
                        category.subCategories.isEmpty
                            ? Get.to(ProductsPage(
                                products: Product.products
                                    .where((element) =>
                                        element.productCategory ==
                                        category.name)
                                    .toList()))
                            : Get.to(ProductCategoriesPage(
                                categories: Category.categories));
                      },
                      child: DynamicWidthContainer(
                        text: Category.categories[index].name,
                      ),
                    );
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: HorizontalTextContainer(
                  onTap: () {
                    Get.to(const AllNewArrivalProducts());
                  },
                  titleText: 'New Arrivals',
                ),
              ),
              ProductWidget(
                products: Product.products,
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
