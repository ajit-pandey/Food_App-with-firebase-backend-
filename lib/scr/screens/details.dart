import 'package:carousel_pro/carousel_pro.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:food_course/scr/helpers/commons.dart';
import 'package:food_course/scr/models/featured.dart';
import 'package:food_course/scr/widgets/title.dart';
import 'package:transparent_image/transparent_image.dart';

class Details extends StatefulWidget {
  final FeaturedModel product;

  const Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(children: [
                Carousel(
                  images: [
                    NetworkImage(widget.product.image),
                    NetworkImage(widget.product.image),
                    NetworkImage(widget.product.image)
                    
                    // FadeInImage.memoryNetwork(
                    //     placeholder: kTransparentImage,
                    //     image: widget.product.image),
                    // FadeInImage.memoryNetwork(
                    //     placeholder: kTransparentImage,
                    //     image: widget.product.image),
                    // FadeInImage.memoryNetwork(
                    //     placeholder: kTransparentImage,
                    //     image: widget.product.image),
                  ],
                  dotBgColor: white,
                  dotColor: grey,
                  dotIncreasedColor: red,
                  dotIncreaseSize: 2,
                  autoplay: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          print("Ajit");
                        }),
                    Stack(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: black,
                              size: 29,
                            ),
                            onPressed: null),
                        Positioned(
                          top: 3,
                          right: 6,
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: grey,
                                    offset: Offset(2, 3),
                                    blurRadius: 3,
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 1.0, right: 1),
                              child: CustomText(text: "22", color: red),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 14,
                  bottom: 50,
                  child: Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: grey, offset: Offset(2, 3), blurRadius: 3),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Icon(Icons.favorite, size: 22, color: red),
                    ),
                  ),
                )
              ]),
            ),
            CustomText(
                text: widget.product.name, size: 24, weight: FontWeight.bold),
            CustomText(text: "\$" + widget.product.price.toString(), size: 18),
            SizedBox(height: 15),
            CustomText(text: "Description", size:18,weight: FontWeight.bold,),
            CustomText(text: widget.product.description, size:18,color: grey,),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.remove,
                      size: 28,
                      color: red,
                    ),
                    onPressed: () {}),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                      child: CustomText(
                        text: "Add to Bag",
                        color: white,
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 28,
                      color: Colors.green,
                    ),
                    onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
