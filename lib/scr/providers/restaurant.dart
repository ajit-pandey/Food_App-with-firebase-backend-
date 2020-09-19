import "package:flutter/material.dart";
import 'package:food_course/scr/models/restaurant.dart';
import "../helpers/restaurant.dart";

class RestaurantProvider with ChangeNotifier{
  RestaurantServices _restaurantServices = RestaurantServices();
  List<RestaurantModel> restaurants = [];

  RestaurantProvider.initialize(){
    _loadRestaurants();

  }

  _loadRestaurants() async {
    restaurants = await _restaurantServices.getRestaurants();
    notifyListeners();
  }
}