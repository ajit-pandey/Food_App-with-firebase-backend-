import "package:cloud_firestore/cloud_firestore.dart";

class ProductModel {
  static const NAME = "name";
  static const ID = "id";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const RATES = "rates";

  String _id;
  String _name;
  String _image;
  double _price;
  int _rates;
  double _rating;
  String _restaurantId;
  String _restaurant;
  String _category;
  bool _featured;


  String get id => _id;
  String get name => _name;
  String get image => _image;
  double get price => _price;
  int get rates => _rates;
  double get rating => _rating;
  String get restaurantId => _restaurantId;
  String get restaurant => _restaurant;
  String get category =>_category;
  bool get featured => _featured;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _rates = snapshot.data[RATES];
    _rating = snapshot.data[RATING];
    _restaurantId = snapshot.data[RESTAURANT_ID];
    _restaurant = snapshot.data[RESTAURANT];
    _category = snapshot.data[CATEGORY];
    _featured = snapshot.data[FEATURED];
  }
}
