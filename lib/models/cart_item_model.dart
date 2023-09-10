import 'package:e_commerce_project/models/models.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  int quantity;

  CartItem({this.quantity = 1});

  @override
  List<Object?> get props => [quantity];

  static List<Product> cartItems = [];
}
