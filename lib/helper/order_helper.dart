import 'package:ecom_user_side_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHelper {
  static num orderPriceCalculator(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    num total = 0;
    cartProvider.getCartList.map((e) {
      total += e.totalPrice!;
    }).toList();
    return total;
  }
}
