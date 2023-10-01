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
  final int amount;
  int quantity;
  double averageRating;

  Product({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImageUrl,
    required this.productDescription,
    required this.productCategory,
    required this.productSubCategory,
    this.isFavorite = false,
    required this.amount,
    this.quantity = 1,
    this.averageRating = 4,
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
      productPrice: 190,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Laptop',
      amount: 4,
    ),
    Product(
      productId: 'product-002',
      productName: 'Samsumg Phone',
      productImageUrl: const [
        'https://www.zdnet.com/a/img/resize/4b26deea076adef5a08f9692fdf0fbe68232ed7c/2023/06/21/bddb1566-7ba6-46f0-b347-4e05977c8906/dsc04833.jpg?auto=webp&fit=crop&height=900&width=1200',
        'https://www.albawaba.com/sites/default/files/styles/d08_standard/public/im_new/Sama%20al%20Kurdi/8SmartphonesYouCanBuyForLessThan300-shutterstock-20Feb22.jpg',
      ],
      productPrice: 230,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
      amount: 80,
    ),
    Product(
      productId: 'product-003',
      productName: 'Headset',
      productImageUrl: const [
        'https://images.unsplash.com/photo-1610041321327-b794c052db27?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aGVhZHNldHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNyBgT7Pu5fEHZPuO9uy_X3hPJUbfcRuClEQ&usqp=CAU',
      ],
      productPrice: 740,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Headset',
      amount: 5,
    ),
    Product(
      productId: 'product-004',
      productName: 'Shoes',
      productImageUrl: const [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
      ],
      productPrice: 80,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Clothing',
      productSubCategory: 'Men\'s Shoes',
      amount: 80,
    ),
    Product(
      productId: 'product-005',
      productName: 'Shoes',
      productImageUrl: const [
        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c2hvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
      ],
      productPrice: 280,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Clothing',
      productSubCategory: 'Men\'s Shoes',
      amount: 80,
    ),
    Product(
      productId: 'product-006',
      productName: 'Dog',
      productImageUrl: const [
        'https://wdy.h-cdn.co/assets/16/11/2560x2560/1458326917-square-gettyimages-530330473-1.jpg',
        'https://tractive.com/blog/wp-content/uploads/2016/04/puppy-care-guide-for-new-parents-400x300.jpg',
      ],
      productPrice: 110,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Pet Supplies',
      productSubCategory: 'Dog',
      amount: 80,
    ),
    Product(
      productId: 'product-007',
      productName: 'Dog',
      productImageUrl: const [
        'https://www.morganstanley.com/content/dam/msdotcom/ideas/pet-care/tw-pet-care.jpg',
        'https://images.theconversation.com/files/438138/original/file-20211216-25-1hu3e65.jpg?ixlib=rb-1.1.0&rect=42%2C0%2C4715%2C3126&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip',
      ],
      productPrice: 150,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Pet Supplies',
      productSubCategory: 'Dog',
      amount: 80,
    ),
    Product(
      productId: 'product-008',
      productName: 'Cat',
      productImageUrl: const [
        'https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:eco%2Cw_1200/MTk3MjI5OTczMDA0NjI0OTc5/cute-pet-names.png',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg_Sfzu9_1AdnZxqUjO5vsKPwObm6pPEQ9dJYDucH38uqdh1sk-nVNcOpmhPB5vZyl_L0&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3eNyHBVlu4vwYvZLW2_I8kA6yu2t2NkbW__leQKdJzzgVVcp-P_erButGOGJMMSA03cw&usqp=CAU'
      ],
      productPrice: 10,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Pet Supplies',
      productSubCategory: 'Cat',
      amount: 80,
    ),
    Product(
      productId: 'product-009',
      productName: 'Apple MacBook',
      productImageUrl: const [
        'https://www.apple.com/newsroom/images/product/mac/standard/Apple-MacBook-Pro-M2-Pro-and-M2-Max-hero-230117.jpg.og.jpg?202308281510',
        'https://techwings.ae/wp-content/uploads/2020/10/Apple-MacBook-Pro-16-inch-16GB-RAM-512GB-Storage-2.6GHz-Intel-Core-i7-Space-Gray-MVVJ2LL-1.jpg',
      ],
      productPrice: 590,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Laptop',
      amount: 80,
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
      productPrice: 599,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
      amount: 80,
    ),
    Product(
      productId: 'product-011',
      productName: 'iphone 11',
      productImageUrl: const [
        'https://www.zdnet.com/a/img/2019/09/20/c016254f-a4bc-4259-8ddc-5a3b5d913f5a/iphone-11.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZyK2z7Zf5cKf9diXsPcaIrE-dge1fDbfREtcV9mWe-r9moCKNeeDoo_UM19zcYLaDn-k&usqp=CAU',
        'https://cdn.vox-cdn.com/thumbor/WiYx4PbgehZyQx1RxnhcZ2w88pM=/0x0:2040x1360/1400x1400/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/19187341/iphone11DSC_5369.jpg',
      ],
      productPrice: 999,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
      amount: 80,
    ),
    Product(
      productId: 'product-012',
      productName: 'Lenevo',
      productImageUrl: const [
        'https://no1computer.vn/images/products/2023/06/23/large/thinkbook-14-g5-amd-h1_1687488451.jpg',
        'https://vitinhmainguyen.com/wp-content/uploads/2022/06/lenovo-thinkbook-14-gen-4-r5.png',
      ],
      productPrice: 189,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Laptop',
      amount: 80,
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
      productPrice: 199,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Phone',
      amount: 80,
    ),
    Product(
      productId: 'product-014',
      productName: 'Earphone',
      productImageUrl: const [
        'https://4.imimg.com/data4/JD/UX/MY-19364516/original-handsfree-earphone.png',
        'https://cdn.pixabay.com/photo/2014/04/05/11/41/earphone-316753_640.jpg',
      ],
      productPrice: 564,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Headset',
      amount: 80,
    ),
    Product(
      productId: 'product-015',
      productName: 'Tablet',
      productImageUrl: const [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWMZZHLghWOBHrEIR1vBfK8Sil7O0NQHMJb4xzrWShe7JO66aAz8qjaVRAod7J4W5QCZw&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyR8AB_4bh_aS57oWP5KRQZVOZrnv3Zp6ZoQ7hq00r-kUjh93d8TwvcJvaMnDEoWC7nVk&usqp=CAU',
      ],
      productPrice: 298,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Electronics',
      productSubCategory: 'Tablet',
      amount: 80,
    ),
    Product(
      productId: 'product-016',
      productName: 'Boomer kids',
      productImageUrl: const [
        'https://m.media-amazon.com/images/I/81fig+mPBUL._AC_UY1000_.jpg',
      ],
      productPrice: 1248,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Clothing',
      productSubCategory: 'Kids\' Shoes',
      amount: 80,
    ),
    Product(
      productId: 'product-017',
      productName: 'Engtoy kids',
      productImageUrl: const [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0-WsOJzSwKikQgO84EE1o9mBiFiMKJeBzKQ86Ao0gttSNtNPUBMC0gU_SS9nIS4hOcMg&usqp=CAU',
        'https://ae01.alicdn.com/kf/Hef1c1c5e7967483aa2b9c344dcbe1802O/Summer-children-s-sports-shoes-hollow-breathable-volleyball-shoes-running-shoes-boys-tennis-shoes-badminton-shoes.jpg_640x640.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFtNZnYVLV4izh-u3gUzSSnexksboxCI9eyG3A5TBgZpfTZ9SQ2uatHEGTCP2jkRdC0Zk&usqp=CAU',
      ],
      productPrice: 2238,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Clothing',
      productSubCategory: 'Kids\' Shoes',
      amount: 80,
    ),
    Product(
      productId: 'product-018',
      productName: 'Sneaker kids',
      productImageUrl: const [
        'https://ae01.alicdn.com/kf/H7f1a8ca141494fe087d938fbab59054aI/Sports-Shoes-New-Boys-Shoes-Children-Breathable-Net-Shoes-Soft-Sole-Boys-Shoes.jpg',
        'https://ae01.alicdn.com/kf/Ha316dbc92d494b7a9ccfc154452cf615P.jpg_640x640Q90.jpg_.webp',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeoybRt4n7tLlxw5RJy40yqYIzXKw65E80j25YBz-oAdJ-cubIG0VvJixu6V-c28kbcJk&usqp=CAU',
      ],
      productPrice: 493,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Clothing',
      productSubCategory: 'Kids\' Shoes',
      amount: 80,
    ),
    Product(
      productId: 'product-019',
      productName: 'Mercedes',
      productImageUrl: const [
        'data:image/jpeg;base64,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',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1G8zaSqfYWIFdr7QECkr5eZl20DTfaSLjiMojOwFZCu_zQPeGE5AiqX-49hpmDrjHeuE&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJl8-Nom43xvVfYX1HC7r27Wrcg2sGNd4u9y9fvIjGJ0Pl6fcEteS4S0erpPkEjBwVtzQ&usqp=CAU',
      ],
      productPrice: 5430,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Vehicles',
      productSubCategory: 'Cars',
      amount: 80,
    ),
    Product(
      productId: 'product-020',
      productName: 'BMW',
      productImageUrl: const [
        'data:image/jpeg;base64,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',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd0ITsfhXn58lFblqy1EQ1tNMPHRQ73y9CUpzHEJZaoFKhaFSrg9ItSStZ4tmKaWNqpw8&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKXdu3bIKZfYPBBhNXEBbs6086GyLom41fXSNEDHbR2hP6s_PAd1PhrbrjDfpzzQYMrmY&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNu1opUyMICu9OtYNft0UocVFBqyH8jZ0FWWuhOp_ZEYYvbv1onsJ75rvi7a03D9hRPmE&usqp=CAU',
      ],
      productPrice: 3300,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Vehicles',
      productSubCategory: 'Cars',
      amount: 80,
    ),
    Product(
      productId: 'product-021',
      productName: 'Lamborghini',
      productImageUrl: const [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfdxRp8PNii_HZPjNdrZRrXsoTIFMO7VAfQ0RTzbg-HXuNP-sdAYGyTCFBDxzKALHWzeM&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJNhCEXoum3y9togQrT4R00sdYzhzMqeM13rAHFUS485fRr-4--I6-XXAOuTq-JJimkes&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSa9cqpV1X1mPOzPY8jFLmUdtMqFer8RP8v3eV42fCSDE07FvSf2KnETgYpGSsHyWvS9eA&usqp=CAU',
      ],
      productPrice: 8430,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Vehicles',
      productSubCategory: 'Cars',
      amount: 80,
    ),
    Product(
      productId: 'product-022',
      productName: 'Fat Tire Bikes',
      productImageUrl: const [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxkoQYOAruRBQwr5p82cSXQpGmCkrPVD8m3AOOigfcejF2x-WWK4MB0atG3zzwJXo8wvk&usqp=CAU',
      ],
      productPrice: 430,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Vehicles',
      productSubCategory: 'Bicycles',
      amount: 80,
    ),
    Product(
      productId: 'product-023',
      productName: 'Yamaha',
      productImageUrl: const [
        'https://img.freepik.com/free-photo/white-bicycle-standing-park-morning-fitness-loneliness_1153-6768.jpg',
        'https://img.freepik.com/premium-photo/man-bicycle-bicycle-wheels-close-up-foot-is-bicycle-pedal-active-summer_523016-731.jpg',
        'data:image/jpeg;base64,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',
      ],
      productPrice: 3410,
      productDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      productCategory: 'Vehicles',
      productSubCategory: 'Bicycles',
      amount: 2,
    ),
  ];
}
