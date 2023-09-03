import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productId;
  final String productName;
  final String productPrice;
  final List<String> productImageUrl;
  final String productDescription;
  final String productCategory;
  final String productSubCategory;
  bool isFavorite;

  Product({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImageUrl,
    required this.productDescription,
    required this.productCategory,
    required this.productSubCategory,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        productPrice,
        productImageUrl,
        productDescription,
        productCategory,
        productSubCategory,
        isFavorite,
      ];

  static List<Product> products = [
    Product(
      productId: 'product-001',
      productName: 'HP Laptop',
      productImageUrl: const [
        'https://solaroidenergy.com/wp-content/uploads/2023/02/laptop-with-ubuntu-os.jpg'
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Laptop',
    ),
    Product(
      productId: 'product-002',
      productName: 'Samsumg Phone',
      productImageUrl: const [
        'https://www.zdnet.com/a/img/resize/4b26deea076adef5a08f9692fdf0fbe68232ed7c/2023/06/21/bddb1566-7ba6-46f0-b347-4e05977c8906/dsc04833.jpg?auto=webp&fit=crop&height=900&width=1200',
        'https://www.albawaba.com/sites/default/files/styles/d08_standard/public/im_new/Sama%20al%20Kurdi/8SmartphonesYouCanBuyForLessThan300-shutterstock-20Feb22.jpg',
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
    ),
    Product(
      productId: 'product-003',
      productName: 'Headset',
      productImageUrl: const [
        'https://images.unsplash.com/photo-1610041321327-b794c052db27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aGVhZHNldHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNyBgT7Pu5fEHZPuO9uy_X3hPJUbfcRuClEQ&usqp=CAU',
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Headset',
    ),
    Product(
      productId: 'product-004',
      productName: 'Shoes',
      productImageUrl: const [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Clothing',
      productSubCategory: 'Men',
    ),
    Product(
      productId: 'product-005',
      productName: 'Shoes',
      productImageUrl: const [
        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Clothing',
      productSubCategory: 'Men',
    ),
    Product(
      productId: 'product-006',
      productName: 'Dog',
      productImageUrl: const [
        'https://wdy.h-cdn.co/assets/16/11/2560x2560/1458326917-square-gettyimages-530330473-1.jpg',
        'https://tractive.com/blog/wp-content/uploads/2016/04/puppy-care-guide-for-new-parents-400x300.jpg',
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Pet Supplies',
      productSubCategory: 'Dog',
    ),
    Product(
      productId: 'product-007',
      productName: 'Dog',
      productImageUrl: const [
        'https://www.morganstanley.com/content/dam/msdotcom/ideas/pet-care/tw-pet-care.jpg',
        'https://images.theconversation.com/files/438138/original/file-20211216-25-1hu3e65.jpg?ixlib=rb-1.1.0&rect=42%2C0%2C4715%2C3126&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip',
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Pet Supplies',
      productSubCategory: 'Dog',
    ),
    Product(
      productId: 'product-008',
      productName: 'Cat',
      productImageUrl: const [
        'https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:eco%2Cw_1200/MTk3MjI5OTczMDA0NjI0OTc5/cute-pet-names.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg_Sfzu9_1AdnZxqUjO5vsKPwObm6pPEQ9dJYDucH38uqdh1sk-nVNcOpmhPB5vZyl_L0&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3eNyHBVlu4vwYvZLW2_I8kA6yu2t2NkbW__leQKdJzzgVVcp-P_erButGOGJMMSA03cw&usqp=CAU'
      ],
      productPrice: '180',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Pet Supplies',
      productSubCategory: 'Cat',
    ),
    Product(
      productId: 'product-009',
      productName: 'Apple MacBook',
      productImageUrl: const [
        'https://www.apple.com/newsroom/images/product/mac/standard/Apple-MacBook-Pro-M2-Pro-and-M2-Max-hero-230117.jpg.og.jpg?202308281510',
        'https://techwings.ae/wp-content/uploads/2020/10/Apple-MacBook-Pro-16-inch-16GB-RAM-512GB-Storage-2.6GHz-Intel-Core-i7-Space-Gray-MVVJ2LL-1.jpg',
      ],
      productPrice: '990',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Laptop',
    ),
    Product(
      productId: 'product-010',
      productName: 'iphone',
      productImageUrl: const [
        'https://www.apple.com/v/iphone/home/bo/images/meta/iphone__ky2k6x5u6vue_og.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvL4i__N4XFCVuehhzT9KrfOnuj5mNAxNAtEqZ4mzqWnRbr1_jLa6-7iNlnEaTdTqy-XE&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrKtV3PSYPeX6g6YWLi6oEN4h5aT4o_b-xR9Em5c_CbUDw__iRIaMm6O_1LriCV3tPFhA&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyHiTXuQjVh_4ulxBNVT-7zz9nlv5kriItwA&usqp=CAU',
      ],
      productPrice: '990',
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
    ),
  ];
}
