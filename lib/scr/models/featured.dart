import "package:cloud_firestore/cloud_firestore.dart";

class FeaturedModel {
  static const NAME = "name";
  static const ID = "id";
  static const RESTAURANT_ID = "restaurantId";
  static const RATES = "rates";
  static const RATING = "rating";
  static const PRICE = "price";
  static const IMAGE = "image";
  static const FEATURED = "featured";
  static const RESTAURANT = "restaurant";
  static const CATEGORY = "category";
  static const DESCRIPTION = "description";

  String _id;
  String _name;
  int _restaurantId;
  String _restaurant;
  String _image;
  String _category;
  int _price;
  double _rating;
  bool _featured;
  String _rates;
  String _description;

  String get id => _id;
  String get name => _name;
  String get image => _image;
  int get price => _price;
  double get rating => _rating;
  bool get featured => _featured;
  String get rates => _rates;
  String get restaurant => _restaurant;
  String get category => _category;
  int get restaurantId => _restaurantId;
  String get description => _description;

  FeaturedModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _rating = snapshot.data[RATING];
    _featured = snapshot.data[FEATURED];
    _rates = snapshot.data[RATES];
    _restaurant = snapshot.data[RESTAURANT];
    _restaurantId = snapshot.data[RESTAURANT_ID];
    _category = snapshot.data[CATEGORY];
    _description = snapshot.data[DESCRIPTION];
  }
}
