import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_user_side_app/models/cart_model.dart';
import 'package:ecom_user_side_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartServices {
  ///Display Cart List
  Stream<List<CartModel>> streamCartList(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);

    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(user.getUserData.docId)
        .collection('myCart')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => CartModel.fromJson(e.data())).toList());
  }

  ///Add to Cart
  Future<void> addToCart(BuildContext context,
      {required CartModel model, required String uid}) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(uid)
        .collection('myCart')
        .doc();
    await docRef.set(model.toJson(docRef.id));
  }

  ///Remove From Cart
  Future<void> removeFromCart(String docID, String uid) async {
    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(docID)
        .collection('myCart')
        .doc(docID)
        .delete();
  }

  ///Increment Quantity
  Future<void> incrementProductQuantity(BuildContext context,
      {required String docID,
      required num updatedPrice,
      // required num quantity,
      required String uid}) async {
    FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(uid)
        .collection('myCart')
        .doc(docID)
        .update({
      'quantity': FieldValue.increment(1),
      'totalPrice': FieldValue.increment(updatedPrice),
    });
  }

  ///Decrement Quantity
  Future<void> decrementProductQuantity(BuildContext context,
      {required String docID,
      required num updatedPrice,
      required String uid}) async {
    FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(uid)
        .collection('myCart')
        .doc(docID)
        .update({
      'quantity': FieldValue.increment(-1),
      'totalPrice': FieldValue.increment(-updatedPrice),
    });
  }

  ///Check specific Product
  Stream<List<CartModel>> streamSpecificProduct(String productID, String uid) {
    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(uid)
        .collection('myCart')
        .where('productDetails.productID', isEqualTo: productID)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => CartModel.fromJson(e.data())).toList());
  }

  ///Empty My Cart
  Future<void> emptyMyCart(
      {required String docID, required String userID}) async {
    print("User ID : $userID");
    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(userID)
        .collection('myCart')
        .doc(docID)
        .delete();
  }

  ///Delete Specific Item
  Future<void> deleteOneItem(
      {required String docID, required String userID}) async {
    print("User  ID : $userID");
    return FirebaseFirestore.instance
        .collection('cartCollection')
        .doc(userID)
        .collection('myCart')
        .doc(docID)
        .delete();
  }
}
