import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_course/scr/helpers/commons.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          SpinKitFadingCircle(
            color: red,
            size: 30.0
          )

  
      ],
        
      ),
    );
  }
}