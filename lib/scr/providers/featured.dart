import "package:flutter/material.dart";
import 'package:food_course/scr/helpers/featured.dart';
import 'package:food_course/scr/models/featured.dart';
class FeaturedProvider with ChangeNotifier{
  FeaturedServices _featuredServices = FeaturedServices();
  List<FeaturedModel> featured = [];

  FeaturedProvider.initialize(){
    _loadFeatured();

  }

  _loadFeatured() async {
    featured = await _featuredServices.getFeatured();
    notifyListeners();
  }
}