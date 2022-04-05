import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_user_side_app/models/product_model.dart';

class ProductServices {
  ///Create Product
  Future createProduct(ProductModel productModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('productCollection').doc();
    return await docRef.set(productModel.toJson(docRef.id));
  }

  ///Update Product
  Future updateProduct(ProductModel productModel) async {
    return await FirebaseFirestore.instance
        .collection('productCollection')
        .doc(productModel.productId)
        .update({
      'productName': productModel.productName,
      'productDescription': productModel.productDescription,
      'productPrice': productModel.productPrice,
      'productImage': productModel.productImage,
    });
  }

  ///Delete Products
  Future deleteProduct(String productID) async {
    return await FirebaseFirestore.instance
        .collection('productCollection')
        .doc(productID)
        .delete();
  }

  ///Get All Products
  Stream<List<ProductModel>> streamProduct(String categoryID) {
    print(categoryID);
    return FirebaseFirestore.instance
        .collection('productCollection')
        .where('categoryID', isEqualTo: categoryID)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => ProductModel.fromJson(singleDoc.data()))
            .toList());
  }
}
