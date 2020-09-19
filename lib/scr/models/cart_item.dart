import "package:cloud_firestore/cloud_firestore.dart";

class CartItemModel {
  static const NAME = "name";
  static const ID = "id";
  static const PRODUCT_ID = "productId";
  static const QUANTITY = "quantity";
  static const IMAGE = "image";
  static const PRICE = "price";

  String _id;
  String _name;
  String _image;
  double _price;
  int _quantity;
  String _productId;

  String get id => _id;
  String get name => _name;
  String get image => _image;
  double get price => _price;
  int get quantity => _quantity;
  String get productId => _productId;

  CartItemModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _quantity = snapshot.data[QUANTITY];
    _productId = snapshot.data[productId];
  }
}
