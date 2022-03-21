import 'package:ecom_user_side_app/models/product_model.dart';
import 'package:ecom_user_side_app/screens/product_detail_screen.dart';
import 'package:ecom_user_side_app/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductListingScreen extends StatefulWidget {
  final String categoryID;

  ProductListingScreen(this.categoryID);

  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  ProductServices _productServices = ProductServices();

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Listing"),
      ),
      body: StreamProvider.value(
        value: _productServices.streamProduct(widget.categoryID),
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
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                              productModel: list[i])));
                            },
                            child: Text("Check Details"),
                          )
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
