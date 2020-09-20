import "package:flutter/material.dart";
import 'package:food_course/scr/helpers/featured.dart';
import 'package:food_course/scr/models/featured.dart';
class FeaturedProvider with ChangeNotifier{
  FeaturedServices _featuredServices = FeaturedServices();
  List<FeaturedModel> featured = [];
  List<FeaturedModel> featuredByCategory = [];
  List<FeaturedModel> featuredByRestaurant = [];

  FeaturedProvider.initialize(){
    _loadFeatured();

  }

  _loadFeatured() async {
    featured = await _featuredServices.getFeatured();
    notifyListeners();
  }

  Future loadFeaturedByCategory({String categoryName}) async {
    featuredByCategory = await _featuredServices.getFeaturedofCategory(category: categoryName);
    notifyListeners();
  }

   Future loadFeaturedByRestaurant({int restaurantId}) async {
    featuredByRestaurant = await _featuredServices.getProductsByRestautant(id: restaurantId);
    notifyListeners();
  }
}