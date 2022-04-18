import 'dart:developer';

import 'package:ecom_user_side_app/helper/order_helper.dart';
import 'package:ecom_user_side_app/models/cart_model.dart';
import 'package:ecom_user_side_app/models/order_model.dart';
import 'package:ecom_user_side_app/provider/cart_provider.dart';
import 'package:ecom_user_side_app/provider/user_provider.dart';
import 'package:ecom_user_side_app/services/cart_services.dart';
import 'package:ecom_user_side_app/services/order_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  CartServices _cartServices = CartServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    var cartData = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: StreamProvider.value(
        value: _cartServices.streamCartList(context),
        initialData: [CartModel()],
        builder: (context, child) {
          List<CartModel> _cartList = context.watch<List<CartModel>>();
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                                Text("Product Name"),
                                Text(_cartList[i]
                                    .productDetails!
                                    .productName
                                    .toString()),
                                Text("Product Price/Unit"),
                                Text(_cartList[i]
                                    .productDetails!
                                    .productPrice
                                    .toString()),
                                Text("Product Quantity"),
                                Text(_cartList[i].quantity.toString()),
                                Text("Total Price"),
                                Text(_cartList[i].totalPrice.toString()),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _cartServices
                                              .decrementProductQuantity(context,
                                                  docID: _cartList[i]
                                                      .docID
                                                      .toString(),
                                                  updatedPrice: _cartList[i]
                                                      .productDetails!
                                                      .productPrice!,
                                                  uid: user.getUserData.docId
                                                      .toString());
                                        },
                                        icon: Icon(Icons.remove)),
                                    Text(_cartList[i].quantity.toString()),
                                    IconButton(
                                        onPressed: () {
                                          _cartServices
                                              .incrementProductQuantity(context,
                                                  docID: _cartList[i]
                                                      .docID
                                                      .toString(),
                                                  updatedPrice: _cartList[i]
                                                      .productDetails!
                                                      .productPrice!,
                                                  uid: user.getUserData.docId
                                                      .toString());
                                        },
                                        icon: Icon(Icons.add)),
                                  ],
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    _cartServices.deleteOneItem(
                                        docID: _cartList[i].docID.toString(),
                                        userID:
                                            user.getUserData.docId.toString());
                                  },
                                  child: Text("Remove item"),
                                ),
                                Divider(),
                              ],
                            );
                    }),
                RaisedButton(
                  onPressed: () async {
                    await OrderServices()
                        .placeOrder(OrderModel(
                            cart: _cartList,
                            user: user.getUserData,
                            totalBill:
                                OrderHelper.orderPriceCalculator(context),
                            adminID: '1'))
                        .then((value) async {
                      cartData.emptyMyLocalCart();
                      _cartList
                          .map((e) => _cartServices.emptyMyCart(
                              docID: e.docID.toString(),
                              userID: user.getUserData.docId.toString()))
                          .toList();
                    }).catchError((e) {
                      print("Error occurred!");
                    });
                  },
                  child: Text("Place Order!"),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  num getProductUpdatedPrice({required num quantity, required num price}) {
    return quantity * price;
  }
}
