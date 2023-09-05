import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productId;
  final String productName;
  final double productPrice;
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
      productPrice: 180,
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
      productPrice: 180,
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
      productPrice: 180,
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
      productPrice: 180,
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
      productPrice: 180,
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
      productPrice: 180,
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
      productPrice: 180,
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
      productPrice: 180,
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
      productPrice: 990,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Laptop',
    ),
    Product(
      productId: 'product-010',
      productName: 'iphone 12',
      productImageUrl: const [
        'https://www.apple.com/v/iphone/home/bo/images/meta/iphone__ky2k6x5u6vue_og.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvL4i__N4XFCVuehhzT9KrfOnuj5mNAxNAtEqZ4mzqWnRbr1_jLa6-7iNlnEaTdTqy-XE&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrKtV3PSYPeX6g6YWLi6oEN4h5aT4o_b-xR9Em5c_CbUDw__iRIaMm6O_1LriCV3tPFhA&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyHiTXuQjVh_4ulxBNVT-7zz9nlv5kriItwA&usqp=CAU',
      ],
      productPrice: 990,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
    ),
    Product(
      productId: 'product-011',
      productName: 'iphone 11',
      productImageUrl: const [
        'https://www.zdnet.com/a/img/2019/09/20/c016254f-a4bc-4259-8ddc-5a3b5d913f5a/iphone-11.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyK2z7Zf5cKf9diXsPcaIrE-dge1fDbfREtcV9mWe-r9moCKNeeDoo_UM19zcYLaDn-k&usqp=CAU',
        'https://cdn.vox-cdn.com/thumbor/WiYx4PbgehZyQx1RxnhcZ2w88pM=/0x0:2040x1360/1400x1400/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/19187341/iphone11DSC_5369.jpg',
      ],
      productPrice: 990,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
    ),
    Product(
      productId: 'product-012',
      productName: 'Lenevo',
      productImageUrl: const [
        'https://no1computer.vn/images/products/2023/06/23/large/thinkbook-14-g5-amd-h1_1687488451.jpg',
        'https://vitinhmainguyen.com/wp-content/uploads/2022/06/lenovo-thinkbook-14-gen-4-r5.png',
        'data:image/jpeg;base64,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',
      ],
      productPrice: 180,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Laptop',
    ),
    Product(
      productId: 'product-013',
      productName: 'Samsung S7',
      productImageUrl: const [
        'https://bpc.h-cdn.co/assets/16/10/1280x960/sd-aspect-1457449221-samsung-gs7-duo.jpg',
        'https://s.yimg.com/uu/api/res/1.2/VdnqaMNXbXTqCPOhIhBxqg--~B/Zmk9ZmlsbDtoPTU2Mzt3PTg3NTthcHBpZD15dGFjaHlvbg--/https://o.aolcdn.com/hss/storage/midas/11cd50dc8fd9dce7b68c8e939f5262ce/203512104/Untitled-1.jpg.cf.jpg',
        'https://www.techspot.com/articles-info/1147/images/S7EdgeS-4.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfIgxtDynnBjtCLdtg1_YZR6L9FdimliqU2KUNq1UV7o5BJvHLT-5k3gjggjXnD8kOZ5Y&usqp=CAU',
      ],
      productPrice: 180,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
    ),
    Product(
      productId: 'product-014',
      productName: 'Earphone',
      productImageUrl: const [
        'https://4.imimg.com/data4/JD/UX/MY-19364516/original-handsfree-earphone.png',
        'https://cdn.pixabay.com/photo/2014/04/05/11/41/earphone-316753_640.jpg',
      ],
      productPrice: 180,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Headset',
    ),
    Product(
      productId: 'product-015',
      productName: 'Tablet',
      productImageUrl: const [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWMZZHLghWOBHrEIR1vBfK8Sil7O0NQHMJb4xzrWShe7JO66aAz8qjaVRAod7J4W5QCZw&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyR8AB_4bh_aS57oWP5KRQZVOZrnv3Zp6ZoQ7hq00r-kUjh93d8TwvcJvaMnDEoWC7nVk&usqp=CAU',
      ],
      productPrice: 180,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Tablet',
    ),
  ];
}
