import 'dart:developer';

import 'package:ecom_user_side_app/models/cart_model.dart';
import 'package:ecom_user_side_app/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  CartServices _cartServices = CartServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: StreamProvider.value(
        value: _cartServices.streamCartList(context),
        initialData: [CartModel()],
        builder: (context, child) {
          List<CartModel> _cartList = context.watch<List<CartModel>>();
          return ListView.builder(
              itemCount: _cartList.length,
              itemBuilder: (context, i) {
                print(_cartList.length);
                _cartList
                    .map((e) => log(e.toJson('docID').toString()))
                    .toList();
                return _cartList.isEmpty
                    ? Text("No Data")
                    : Column(
                        children: [
                          Text(_cartList[i]
                              .productDetails!
                              .productName
                              .toString()),
                          Text(_cartList[i]
                              .productDetails!
                              .productPrice
                              .toString()),
                          // Row(
                          //   children: [
                          //     IconButton(
                          //         onPressed: () {}, icon: Icon(Icons.remove)),
                          //     Text(_cartList[i].totalPrice.toString()),
                          //     IconButton(
                          //         onPressed: () {}, icon: Icon(Icons.add)),
                          //   ],
                          // ),
                        ],
                      );
              });
        },
      ),
    );
  }
}
