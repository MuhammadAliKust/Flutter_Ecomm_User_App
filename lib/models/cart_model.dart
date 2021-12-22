// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecom_user_side_app/models/product_model.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.userId,
    this.totalBill,
    this.product,
  });

  String? userId;
  String? totalBill;
  List<ProductModel>? product;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        userId: json["userID"],
        totalBill: json["totalBill"],
        product: List<ProductModel>.from(
            json["product"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "totalBill": totalBill,
        "product": List<dynamic>.from(product!.map((x) => x.toJson())),
      };
}
