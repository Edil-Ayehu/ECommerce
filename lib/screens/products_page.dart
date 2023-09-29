// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:e_commerce_project/models/models.dart';
// import 'package:e_commerce_project/screens/screens.dart';
// import 'package:e_commerce_project/widgets/widgets.dart';
//
// class ProductsPage extends StatefulWidget {
//   final List<Product> products;
//
//   const ProductsPage({
//     super.key,
//     required this.products,
//   });
//
//   @override
//   State<ProductsPage> createState() => _ProductsPageState();
// }
//
// class _ProductsPageState extends State<ProductsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Get.isDarkMode ? const Color(0xFF2C2D30) : Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text('Products'),
//       ),
//       body: widget.products.isEmpty
//           ? Container(
//               decoration: BoxDecoration(
//                 color: Get.isDarkMode
//                     ? const Color(0xFF2C2D30)
//                     : Colors.grey.shade200,
//                 borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(28),
//                   topLeft: Radius.circular(28),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "No Item found!",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     width: double.infinity,
//                     height: 45,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                       ),
//                       onPressed: () {},
//                       child: const Text('Back to home'),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           : Container(
//               decoration: BoxDecoration(
//                 color: Get.isDarkMode
//                     ? const Color(0xFF2C2D30)
//                     : Colors.grey.shade200,
//                 borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(28),
//                   topLeft: Radius.circular(28),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Sort by',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                         const Spacer(),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black,
//                           ),
//                           onPressed: () {
//                             widget.products.sort((a, b) => a.productName
//                                 .toLowerCase()
//                                 .compareTo(b.productName.toLowerCase()));
//                             setState(() {});
//                           },
//                           child: const Text('Name'),
//                         ),
//                         const SizedBox(width: 4),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             side: const BorderSide(
//                               color: Colors.black,
//                               width: 1,
//                             ),
//                           ),
//                           onPressed: () {
//                             widget.products.sort((a, b) =>
//                                 a.productPrice.compareTo(b.productPrice));
//                             setState(() {});
//                           },
//                           child: const Text(
//                             'Price',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Expanded(
//                     child: GridView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       padding: const EdgeInsets.only(left: 8, right: 8),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 3.0,
//                         mainAxisSpacing: 8.0,
//                         mainAxisExtent: 240,
//                       ),
//                       itemCount: widget.products.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 Get.to(ProductDetailsPage(
//                                   product: widget.products[index],
//                                 ));
//                               },
//                               child: VerticalProductContainer(
//                                   product: widget.products[index]),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
