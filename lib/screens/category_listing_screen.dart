import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_user_side_app/models/category_model.dart';
import 'package:ecom_user_side_app/screens/product_listing_screen.dart';
import 'package:ecom_user_side_app/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListingScreen extends StatelessWidget {
  CategoryServices _categoryServices = CategoryServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Listing"),
      ),
      body: StreamProvider.value(
        value: _categoryServices.streamCategories(),
        initialData: [CategoryModel()],
        builder: (context, child) {
          List<CategoryModel> list = context.watch<List<CategoryModel>>();
          return list[0].categoryId == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : list.isEmpty
                  ? Text("No Data")
                  : ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductListingScreen(list[i]
                                                .categoryId
                                                .toString())));
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Divider(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          list[i].categoryName.toString(),
                                          style: TextStyle(
                                              fontSize: 29,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    CachedNetworkImage(
                                      imageUrl:
                                          list[i].categoryImage.toString(),
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      });
        },
      ),
    );
  }
}
