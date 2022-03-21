import 'package:ecom_user_side_app/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _list = [];

  void saveCartData(CartModel cartModel) {
    _list.add(cartModel);
    notifyListeners();
  }

  List<CartModel> get getCartList => _list;
}
