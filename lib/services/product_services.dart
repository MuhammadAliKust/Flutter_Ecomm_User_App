import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_user_side_app/models/category_model.dart';
import 'package:ecom_user_side_app/models/product_model.dart';

class ProductServices {
  ///Create Product
  Future createProduct(ProductModel categoryModel) async {
    return await FirebaseFirestore.instance
        .collection('productCollection')
        .add(categoryModel.toJson());
  }

  ///Update Category
  Future updateProduct(ProductModel categoryModel) async {
    return await FirebaseFirestore.instance
        .collection('productCollection')
        .doc(categoryModel.categoryId)
        .update({
      //TODO: Write update product fields till tomorrow
    });
  }

  ///Delete Category
  Future deleteProduct(String categoryID) async {
    return await FirebaseFirestore.instance
        .collection('productCollection')
        .doc(categoryID)
        .delete();
  }

  ///Get All Categories
  Stream<List<ProductModel>> streamProduct() {
    return FirebaseFirestore.instance
        .collection('productCollection')
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => ProductModel.fromJson(singleDoc.data()))
            .toList());
  }
}
