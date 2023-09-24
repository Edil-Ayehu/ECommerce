import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  final List _advertisement = [
    {"title": "Advertisement 1", "url": "images/add1.jpg"},
    {"title": "Advertisement 2", "url": "images/add2.jpg"},
  ];

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text('welcome'.tr),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (_auth.currentUser?.email != null) {
                      Get.to(const WishlistPage());
                      setState(() {});
                    } else {
                      Get.off(SigninScreen());
                    }
                  },
                  child: NotificationAvatar(
                    counter: Product.products
                        .where((element) => element.isFavorite)
                        .toList()
                        .length,
                    icon: Icons.favorite,
                    bgColor:
                        Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.white,
                    iconColor: Get.isDarkMode ? Colors.white70 : Colors.black,
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
                    bgColor:
                        Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.white,
                    iconColor: Get.isDarkMode ? Colors.white70 : Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
        drawer: MyDrawer(),
        bottomNavigationBar: const CustomBottonNavBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Get.isDarkMode ? Colors.white70 : Colors.black,
          elevation: 5,
          onPressed: () {
            Get.to(CartPage(cartItems: CartItem.cartItems));
          },
          child: NotificationAvatar(
            counter: CartItem.cartItems.length,
            icon: Icons.shopping_cart_outlined,
            bgColor: Colors.transparent,
            iconColor: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomSearchBar(
                    productItems:
                        Product.products.map((e) => e.productName).toList()),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: HorizontalTextContainer(
                  onTap: () {
                    Get.to(
                        ProductCategoriesPage(categories: Category.categories));
                  },
                  titleText: 'Shop by Category',
                ),
              ),
              SizedBox(
                height: 50,
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
                        icon: Category.categories[index].icon,
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
                  enlargeCenterPage: true,
                  enlargeFactor: 1,
                  height: 140,
                ),
              ),
              const SizedBox(height: 15),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: HorizontalTextContainer(
              //     onTap: () {
              //       Get.to(const NewProductsPage());
              //     },
              //     titleText: 'Recommendations',
              //   ),
              // ),
              // SizedBox(
              //   height: 240,
              //   child: ListView.builder(
              //     itemCount: 10,
              //     scrollDirection: Axis.horizontal,
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(left: 15.0),
              //         child: VerticalProductContainer(
              //             product: Product.products[index]),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: HorizontalTextContainer(
                  onTap: () {
                    Get.to(const NewProductsPage());
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
