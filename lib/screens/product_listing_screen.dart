import 'package:ecom_user_side_app/models/product_model.dart';
import 'package:ecom_user_side_app/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductListingScreen extends StatelessWidget {
  final String categoryID;

  ProductListingScreen(this.categoryID);

  ProductServices _productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Listing"),
      ),
      body: StreamProvider.value(
        value: _productServices.streamProduct(categoryID),
        initialData: [ProductModel()],
        builder: (context, child) {
          List<ProductModel> list = context.watch<List<ProductModel>>();
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                list[i].productName.toString(),
                                style: TextStyle(fontSize: 23),
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        list[i].productImage.toString()))),
                          ),
                          Text("RS: ${list[i].productPrice.toString()}"),
                          RatingBarIndicator(
                            rating:
                                double.parse(list[i].productRating.toString()),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 30.0,
                            direction: Axis.horizontal,
                          ),
                        ],
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
