import "package:flutter/material.dart";
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/models/featured.dart';
import 'package:food_course/scr/models/products.dart';
import 'package:food_course/scr/screens/details.dart';
import 'package:food_course/scr/widgets/loading.dart';
import 'package:food_course/scr/widgets/title.dart';
import 'package:transparent_image/transparent_image.dart';

import '../helpers/commons.dart';

// List<Product> productsList = [
//   Product(
//       name: "Cereals",
//       price: 5.99,
//       rating: 4.2,
//       vendor: "GoodFoods",
//       wishList: true,
//       image: "images/table.png"),
//   Product(
//       name: "Cereals",
//       price: 5.99,
//       rating: 4.2,
//       vendor: "GoodFoods",
//       wishList: false,
//       image: "images/table.png"),
//   Product(
//       name: "Cereals",
//       price: 5.99,
//       rating: 4.2,
//       vendor: "GoodFoods",
//       wishList: true,
//       image: "images/table.png"),
//   Product(
//       name: "Cereals",
//       price: 5.99,
//       rating: 4.2,
//       vendor: "GoodFoods",
//       wishList: true,
//       image: "images/table.png"),
//   Product(
//       name: "Cereals",
//       price: 5.99,
//       rating: 4.2,
//       vendor: "GoodFoods",
//       wishList: true,
//       image: "images/table.png")
// ];

List<ProductModel> productsList = [];

class FeaturedWidget extends StatelessWidget {
  final FeaturedModel featured;

  const FeaturedWidget({Key key, this.featured}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        // height: 190,
        width: 210,
        decoration: BoxDecoration(color: white, boxShadow: [
          BoxShadow(color: red[50], offset: Offset(4, 6), blurRadius: 30)
        ],
        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(14))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(14)),
                              child: Container(
                                height: 120,
                                width: 240,
                                child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height:120,child: Loading()),
                  ),
                  Positioned.fill(
                  
                                            child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,

                      image: featured.image,
                      fit: BoxFit.fitWidth
                      // height: 140,
                      // width: 140,
                    ),
                  ),
                ],
              ),
                              ),
            ),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: featured.name,
                    )),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: grey,
                              offset: Offset(1, 1),
                              blurRadius: 4)
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite,
                          color: red,
                          size: 18,
                        )),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CustomText(
                          text: "${featured.rating}",
                          size: 14,
                          color: grey),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.star, color: red, size: 16),
                    Icon(Icons.star, color: red, size: 16),
                    Icon(Icons.star, color: red, size: 16),
                    Icon(Icons.star, color: red, size: 16),
                    Icon(Icons.star, color: grey, size: 16)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CustomText(
                    text: featured.price.toString(),
                    weight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
