import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_project/screens/screens.dart';
import 'package:e_commerce_project/services/reusable_functions.dart';
import 'package:e_commerce_project/widgets/widgets.dart';
import 'package:e_commerce_project/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(
          'welcome'.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (_auth.currentUser?.email != null) {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const WishlistPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  } else {
                    ReusableFunctions.showErrorDialog(
                      context,
                      'Please sign in or create an account to continue.',
                    );
                  }
                },
                child: NotificationAvatar(
                  isWishlistCounter: true,
                  icon: Icons.favorite,
                  bgColor:
                      Get.isDarkMode ? const Color(0xFF3E3E43) : Colors.white,
                  iconColor: Get.isDarkMode ? Colors.white70 : Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  if (_auth.currentUser?.email != null) {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const CartPage(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                    //setState(() {});
                  } else {
                    ReusableFunctions.showErrorDialog(
                      context,
                      'Please sign in or create an account to continue.',
                    );
                  }
                },
                child: NotificationAvatar(
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
          if (_auth.currentUser?.email != null) {
            Navigator.push(
              context,
              PageTransition(
                child: const CartPage(),
                type: PageTransitionType.rightToLeft,
              ),
            );
          } else {
            ReusableFunctions.showErrorDialog(
              context,
              'Please sign in or create an account to continue.',
            );
          }
        },
        child: NotificationAvatar(
          icon: Icons.shopping_cart_outlined,
          bgColor: Colors.transparent,
          iconColor: Get.isDarkMode ? Colors.black : Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder<QuerySnapshot>(
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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomSearchBar(
                    productItems: products,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: HorizontalTextContainer(
                    onTap: () {
                      Get.to(ProductCategoriesPage(
                          categories: Category.categories));
                    },
                    titleText: 'categories'.tr,
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
                          // category.subCategories.isEmpty
                          //     ? Get.to(ProductsPage(
                          //         products: Product.products
                          //             .where((element) =>
                          //                 element.productCategory ==
                          //                 category.name)
                          //             .toList()))
                          //     : Get.to(ProductCategoriesPage(
                          //         categories: Category.categories));
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
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    aspectRatio: 2,
                    enlargeCenterPage: true,
                    enlargeFactor: 1,
                    height: 140,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 15, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Recommendations',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: SquareContainer(products: products),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: HorizontalTextContainer(
                    onTap: () {
                      Get.to(NewProductsPage(products: products));
                    },
                    titleText: 'new products'.tr,
                  ),
                ),
                ProductWidget(
                  itemCount: 10,
                  products: products,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
