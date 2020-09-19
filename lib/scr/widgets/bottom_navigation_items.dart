import "package:flutter/material.dart";
import 'package:food_course/scr/widgets/title.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({this.image, this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap ?? null,
          child: Column(
            children: [
              Image.asset(image, width: 26, height: 26),
              SizedBox(
                height: 2,
              ),
              CustomText(text: name)
            ],
          ),
        ));
  }
}
