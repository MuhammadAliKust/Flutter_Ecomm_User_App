// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.categoryId,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productRating,
    this.productId,
    this.productImage,
  });

  String? categoryId;
  String? productName;
  String? productDescription;
  String? productPrice;
  String? productRating;
  String? productId;
  String? productImage;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        categoryId: json["categoryID"],
        productName: json["productName"],
        productDescription: json["productDescription"],
        productPrice: json["productPrice"],
        productRating: json["productRating"],
        productId: json["productID"],
        productImage: json["productImage"],
      );

  Map<String, dynamic> toJson() => {
        "categoryID": categoryId,
        "productName": productName,
        "productDescription": productDescription,
        "productPrice": productPrice,
        "productRating": productRating,
        "productID": productId,
        "productImage": productImage,
      };
}
