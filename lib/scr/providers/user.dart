import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:food_course/scr/helpers/user.dart';
import 'package:food_course/scr/models/user.dart';


enum Status{
  Uninitialized, Unauthenticated, Authenticating, Authenticated

}

class UserProvider with ChangeNotifier{
  Firestore _firestore = Firestore.instance;
  FirebaseAuth _auth;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  UserModel _userModel;

  // geters
  Status get status =>_status;
  FirebaseUser get user => _user;
  UserModel get userModel => _userModel;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  UserProvider.initialize(): _auth = FirebaseAuth.instance{
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn() async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim() );
      return true;
    }
    catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      print("error: " + e.toString());
      return false;

    }
  }
  Future<bool> signUp()async{
    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((result){
        _firestore.collection("users").document(result.user.uid).setData({
           "name": name.text,
           "email": email.text,
           "uid": result.user.uid,
           "likedFood":[],
           "likedRestaurants":[]


        });
      });
      return true;
    }
    catch(e){ 
       return _onError(e.toString());
       
    }
  }

  Future signOut(){

    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  
  Future<void> _onStateChanged(FirebaseUser firebaseUser) async{
    if(user == null){
      _status = Status.Unauthenticated;
    }
    else{
      _user = firebaseUser;
      _status = Status.Authenticated;
      _userModel = await _userServices.getUserById(firebaseUser.uid);
    }
    notifyListeners();
  }

  // General Methods
bool _onError(String e){
    _status = Status.Authenticated;
        notifyListeners();
        print("Error is :" + e);
        return false;
  }

  void cleanControllers(){
    email.text = "";
    password.text = "";
    name.text = "";
  }
  }
  

