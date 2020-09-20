import "package:cloud_firestore/cloud_firestore.dart";
import 'package:food_course/scr/models/featured.dart';

class FeaturedServices{
  String collection = "featured";
  Firestore _firestore = Firestore.instance;

  Future<List<FeaturedModel>> getFeatured() async => _firestore.collection(collection).
  getDocuments().
  then((result)
  {
    List<FeaturedModel> featured = [];
  for(DocumentSnapshot category in result.documents){
    featured.add(FeaturedModel.fromSnapshot(category));

  }
  return featured;

  });

  Future<List<FeaturedModel>> getFeaturedofCategory({String category}) async =>
   _firestore.collection(collection).where("category", isEqualTo: category).
  getDocuments().
  then((result)
  {
    List<FeaturedModel> featured = [];
  for(DocumentSnapshot category in result.documents){
    featured.add(FeaturedModel.fromSnapshot(category));

  }
  return featured;

  });

  Future<List<FeaturedModel>> getProductsByRestautant({int id}) async =>
   _firestore.collection(collection).where("restaurantId", isEqualTo: id).
  getDocuments().
  then((result)
  {
    List<FeaturedModel> featured = [];
  for(DocumentSnapshot category in result.documents){
    featured.add(FeaturedModel.fromSnapshot(category));

  }
  return featured;

  });
}