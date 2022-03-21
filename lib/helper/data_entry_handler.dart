import 'package:ecom_user_side_app/models/category_model.dart';
import 'package:ecom_user_side_app/models/product_model.dart';
import 'package:ecom_user_side_app/services/category_services.dart';
import 'package:ecom_user_side_app/services/product_services.dart';
import 'package:flutter/material.dart';

class DataEntryHandler extends StatelessWidget {
  CategoryServices _categoryServices = CategoryServices();
  ProductServices _productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Entry Handler"),
      ),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            _categoryServices.createCategory(CategoryModel(
                categoryId: "2",
                categoryImage:
                    "https://d1whtlypfis84e.cloudfront.net/guides/wp-content/uploads/2021/03/28193129/Electronics.png",
                categoryName: "Plants"));
          },
          child: Text("Create Category"),
        ),
        RaisedButton(
          onPressed: () {
            _productServices.createProduct(ProductModel(
              categoryId: "1",
              productName: "Mobile",
              productDescription:
                  "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
              productImage: "",
              productPrice: 456,
            ));
          },
          child: Text("Create Product"),
        ),
      ],
    );
  }
}
