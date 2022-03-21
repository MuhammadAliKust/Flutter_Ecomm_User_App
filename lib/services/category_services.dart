import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_user_side_app/models/category_model.dart';

class CategoryServices {
  ///Create Category
  Future createCategory(CategoryModel categoryModel) async {
    return await FirebaseFirestore.instance
        .collection('categoryCollection')
        .add(categoryModel.toJson());
  }

  ///Update Category
  Future updateCategory(CategoryModel categoryModel) async {
    return await FirebaseFirestore.instance
        .collection('categoryCollection')
        .doc(categoryModel.categoryId)
        .update({
      'categoryImage': categoryModel.categoryImage,
      'categoryName': categoryModel.categoryName
    });
  }

  ///Delete Category
  Future deleteCategory(String categoryID) async {
    return await FirebaseFirestore.instance
        .collection('categoryCollection')
        .doc(categoryID)
        .delete();
  }

  ///Get All Categories
  Stream<List<CategoryModel>> streamCategories() {
    return FirebaseFirestore.instance
        .collection('categoryCollection')
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => CategoryModel.fromJson(singleDoc.data()))
            .toList());
  }
}
