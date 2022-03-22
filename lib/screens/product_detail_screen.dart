import 'package:ecom_user_side_app/models/cart_model.dart';
import 'package:ecom_user_side_app/models/product_model.dart';
import 'package:ecom_user_side_app/provider/cart_provider.dart';
import 'package:ecom_user_side_app/provider/user_provider.dart';
import 'package:ecom_user_side_app/services/cart_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;

  const ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  CartServices _cartServices = CartServices();

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.productModel.productName.toString(),
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
                                widget.productModel.productImage.toString()))),
                  ),
                  Text("RS: ${widget.productModel.productPrice.toString()}"),
                  RatingBarIndicator(
                    rating: double.parse(
                        widget.productModel.productRating.toString()),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30.0,
                    direction: Axis.horizontal,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (quantity > 1) quantity--;
                            setState(() {});
                          },
                          icon: Icon(Icons.remove)),
                      Text(quantity.toString()),
                      IconButton(
                          onPressed: () {
                            quantity++;
                            setState(() {});
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ),
                  Text((quantity * widget.productModel.productPrice!)
                      .toString()),
                  RaisedButton(
                    onPressed: () {
                      // // print(cartProvider.getCartList.length);
                      // cartProvider.getCartList
                      //     .map((e) => log(e.toJson('').toString()))
                      //     .toList();
                      // // log(cartProvider.getCartList[0].toJson('docID').toString());
                      // return;
                      cartProvider.saveCartData(CartModel(
                          quantity: quantity,
                          totalPrice:
                              quantity * widget.productModel.productPrice!,
                          uID: userProvider.getUserData.docId,
                          productDetails: widget.productModel));

                      _cartServices.addToCart(context,
                          model: CartModel(
                              quantity: quantity,
                              totalPrice:
                                  quantity * widget.productModel.productPrice!,
                              uID: userProvider.getUserData.docId,
                              productDetails: widget.productModel),
                          uid: userProvider.getUserData.docId.toString());
                    },
                    child: Text("Add to Cart"),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
