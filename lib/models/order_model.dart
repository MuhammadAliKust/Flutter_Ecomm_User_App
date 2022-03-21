// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:ecom_user_side_app/models/cart_model.dart';
import 'package:ecom_user_side_app/models/user_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) =>
    json.encode(data.toJson(data.user!.docId.toString()));

class OrderModel {
  OrderModel({
    this.orderID,
    this.cart,
    this.user,
    this.isProcessed,
    this.placementDate,
    this.processedData,
    this.completedDate,
    this.cancelledDate,
    this.isCompleted,
    this.isPending,
    this.isCancelled,
    this.storeID,
    this.totalBill,
  });
String? orderID;
  CartModel? cart;
  UserModel? user;
  bool? isProcessed;
  bool? isPending;
  bool? isCompleted;
  num? totalBill;
  String? placementDate;
  String? processedData;
  String? completedDate;
  String? cancelledDate;
  String? isCancelled;
  String? storeID;


  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        cart: CartModel.fromJson(json["cart"]),
        user: UserModel.fromJson(json["user"]),
        isProcessed: json["isProcessed"],
    orderID: json["orderID"],
        placementDate: json["placementDate"],
        isCompleted: json["isCompleted"],
        isPending: json["isPending"],
        isCancelled: json["isCancelled"],
        storeID: json["storeID"],
        processedData: json["processedData"],
        cancelledDate: json["cancelledDate"],
        completedDate: json["completedDate"],
        totalBill: json["totalBill"],
      );

  Map<String, dynamic> toJson(String userID) => {
        "cart": cart!.toJson(userID),
        "user": user!.toJson(userID),
        "isProcessed": false,
        "orderID": orderID,
        "placementDate": placementDate,
        "processedData": processedData,
        "completedDate": completedDate,
        "cancelledDate": cancelledDate,
        "storeID": storeID,
        "totalBill": totalBill,
        "isCompleted": false,
        "isCancelled": false,
        "isPending": true,
      };
}
