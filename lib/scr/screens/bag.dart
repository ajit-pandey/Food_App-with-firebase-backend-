import "package:flutter/material.dart";
import 'package:food_course/scr/helpers/commons.dart';
import 'package:food_course/scr/widgets/title.dart';

class ShoppingBag extends StatefulWidget {

   

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color:black),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Shopping Bag",size:20 ,weight: FontWeight.bold,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top:0.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.shopping_cart,size:30), onPressed: null),
                ),
                Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: grey[400],
                                    offset: Offset(2, 3),
                                    blurRadius: 3,
                                  )
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 1.0, right: 1),
                              child: CustomText(text: "22", color: red,size: 16,),
                            ),
                          ),
                        )
              ],
            ),
          )
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children:[
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     height: 120,
          //     decoration: BoxDecoration(color: white,
          //     boxShadow:[
          //       BoxShadow(
          //         color:red[50],
          //         offset: Offset(3,5),
          //         blurRadius:30
          //       )
          //     ]),
          //     child: Row(
          //       children:[
          //         Image.asset(product.image,height: 120,width: 120,
          //       ),
          //       SizedBox(width:20),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [

          //             RichText(text: TextSpan(children: [
          //             TextSpan(text:product.name + "\n",style: TextStyle(
          //               color:black,
          //               fontSize:20
          //             ),),
          //             TextSpan(text:"\$" + product.price.toString() + "\n",style: TextStyle(
          //               color:black,
          //               fontSize:17,
          //               fontWeight: FontWeight.bold
          //             ),)],
          //             ),
          //             ),
          //             SizedBox(width:100),
          //             IconButton(icon: Icon(Icons.delete), onPressed: null)
          //           ],
          //         )
          //       ]
          //     ),
          //   ),
          // )
        ]
      ),
      
    );
  }
}