import 'package:equatable/equatable.dart';

class Advertisement extends Equatable {
  final String companyName;
  final String imageUrl;

  Advertisement({required this.imageUrl, required this.companyName});

  @override
  List<Object?> get props => [companyName, imageUrl];

  static List<Advertisement> advertisements = [
    Advertisement(imageUrl: 'images/add1.jpg', companyName: 'Coca cola'),
    Advertisement(imageUrl: 'images/add2.jpg', companyName: 'Samsung'),
  ];
}
