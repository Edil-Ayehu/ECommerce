import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String name;
  final double price;
  int quantity;
  final String productImageUrl;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.productImageUrl,
  });

  @override
  List<Object?> get props => [name, price, quantity];

  static List<CartItem> cartItems = [];
}