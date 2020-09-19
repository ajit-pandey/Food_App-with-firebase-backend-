import "package:flutter/material.dart";
import 'package:food_course/scr/helpers/commons.dart';
import 'package:food_course/scr/models/restaurant.dart';
import 'package:food_course/scr/widgets/small_floating_button.dart';
import 'package:transparent_image/transparent_image.dart';

import 'loading.dart';

class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantWidget({Key key, this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 120,
                        child: Loading()),
                    ),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      // categoriesList[index].image,
                      image: restaurant.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallButton(icon: Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(children: [
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow[900],
                                  size: 20,
                                ),
                              ),
                              Text(restaurant.rating.toString())
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
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
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 8, 8, 14),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "${restaurant.name}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "\nby: ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  TextSpan(
                                    text: "${restaurant.resName}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "${restaurant.avgPrice}",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700))
                              ])),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            );
      
  
  }
}