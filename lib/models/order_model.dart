// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecom_user_side_app/models/cart_model.dart';
import 'package:ecom_user_side_app/models/user_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.cart,
    this.user,
    this.isProcessed,
    this.placementDate,
    this.isCompleted,
    this.isPending,
  });

  CartModel? cart;
  UserModel? user;
  bool? isProcessed;
  bool? isPending;
  bool? isCompleted;
  String? placementDate;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        cart: CartModel.fromJson(json["cart"]),
        user: UserModel.fromJson(json["user"]),
        isProcessed: json["isProcessed"],
        placementDate: json["placementDate"],
        isCompleted: json["isCompleted"],
        isPending: json["isPending"],
      );

  Map<String, dynamic> toJson() => {
        "cart": cart!.toJson(),
        "user": user!.toJson(),
        "isProcessed": isProcessed,
        "placementDate": placementDate,
        "isCompleted": isCompleted,
        "isPending": isPending,
      };
}
