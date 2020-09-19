import "package:cloud_firestore/cloud_firestore.dart";

class RestaurantModel {
  static const NAME = "name";
  static const ID = "id";
  static const RATING = "rating";
   static const RATES = "rates";
  static const AVG_PRICE = "avgPrice";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const RES_NAME = "resName";

  int _id;
  String _name;
  String _image;
  int _avgPrice;
  double _rating;
  bool _popular;
  int _rates;
  String _resName;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  int get avgPrice => _avgPrice;
  double get rating => _rating;
  bool get popular => _popular;
  int get rates => _rates;
  String get resName => _resName;

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _avgPrice = snapshot.data[AVG_PRICE];
    _rating = snapshot.data[RATING];
    _popular = snapshot.data[POPULAR];
    _rates = snapshot.data[RATES];
    _resName = snapshot.data[RES_NAME];
  }
}
