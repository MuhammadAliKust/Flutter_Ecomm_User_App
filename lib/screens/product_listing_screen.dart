import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryListingScreen extends StatelessWidget {
  const CategoryListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Listing"),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Laptop"),
                  ],
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://thumbs.dreamstime.com/z/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-164230611.jpg'))),
                ),
                Text("RS: 10000"),
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 50.0,
                  direction: Axis.vertical,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
