import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_project/screens/products_page.dart';
import 'package:e_commerce_project/widgets/horizontal_text_container.dart';
import 'package:e_commerce_project/widgets/notification_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/models.dart';
import 'screens.dart';
import '../widgets/widgets.dart';

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
    await Future.delayed(const Duration(seconds: 2));

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
        drawer: const MyDrawer(),
        bottomNavigationBar: const CustomBottonNavBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          elevation: 5,
          onPressed: () {
            Get.to(CartPage(cartItems: CartItem.cartItems));
          },
          child: NotificationAvatar(
            counter: CartItem.cartItems.length,
            icon: Icons.shopping_cart_outlined,
            bgColor: Colors.transparent,
            iconColor: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
