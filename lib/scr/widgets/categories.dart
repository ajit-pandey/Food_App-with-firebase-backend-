import "package:flutter/material.dart";
import 'package:food_course/scr/models/category.dart';
import 'package:food_course/scr/providers/category.dart';
import 'package:food_course/scr/widgets/title.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../helpers/commons.dart';
import 'loading.dart';

// List<Category> categoriesList = [
//     Category(name: "Salad",image: "images/food.jpg"),
//     Category(name: "Steak",image: "images/food.jpg"),
//     Category(name: "FastFood",image: "images/food.jpg"),
//     Category(name: "Roast",image: "images/food.jpg"),
//     Category(name: "Desserts",image: "images/food.jpg")
// ];
List<CategoryModel> categoriesList = [];

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final categoryProvider  = Provider.of<CategoryProvider >(context);

    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            width: 200,
            decoration: BoxDecoration(
              color: red,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: red[50], offset: Offset(4, 6), blurRadius: 20)
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Loading(),
                    ),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      // categoriesList[index].image,
                      image: category.image,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.025),
                          ]))),
            ),
          ),

          // SizedBox(height: 5),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: CustomText(
                      text: category.name, size: 22, color: white)))
        ],
      ),
    );
  }
}
