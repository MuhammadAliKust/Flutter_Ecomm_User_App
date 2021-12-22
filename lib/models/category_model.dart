// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.categoryId,
    this.categoryImage,
    this.categoryName,
  });

  String? categoryId;
  String? categoryImage;
  String? categoryName;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryId: json["categoryID"],
        categoryImage: json["categoryImage"],
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "categoryID": categoryId,
        "categoryImage": categoryImage,
        "categoryName": categoryName,
      };
}
