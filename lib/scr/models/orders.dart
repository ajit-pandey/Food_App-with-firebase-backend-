import "package:cloud_firestore/cloud_firestore.dart";

class OrderModel {
  static const ID = "id";
  static const AMOUNT = "amount";
  static const DESCRIPTION = "description";
  static const PRODUCT_ID = "productId";
  static const USER_ID = "userId";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  

  String _id;
  String _description;
  String _productId;
  int _amount;
  String _status;
  String _userId;
  int _createdAt;
  

  String get id => _id;
  String get name => _description;
  int get createdAt => _createdAt;
  String get productId => _productId;
  int get amount => _amount;
  String get status => _status;
  String get userId => _userId;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data[ID];
    _userId = snapshot.data[USER_ID];
    _productId = snapshot.data[PRODUCT_ID];
    _amount = snapshot.data[AMOUNT];
    _status = snapshot.data[STATUS];
    _description = snapshot.data[DESCRIPTION];
    _createdAt = snapshot.data[CREATED_AT];

  }
}
