import "package:flutter/material.dart";
import 'package:food_course/scr/helpers/commons.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/providers/user.dart';
import 'package:food_course/scr/screens/login.dart';
import 'package:food_course/scr/widgets/loading.dart';
import 'package:food_course/scr/widgets/title.dart';
import 'package:provider/provider.dart';
class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
   final _key  = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: white,
      body: authProvider.status==Status.Authenticating?Loading(): SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo.png",
                  width: 200,
                  height: 200,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        icon: Icon(Icons.person)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(

                    controller: authProvider.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        icon: Icon(Icons.person)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.vpn_key)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () async {
                    if(!await authProvider.signUp()){
                      _key.currentState.showSnackBar(
                        SnackBar(content: Text("Registeration Failed"))
                      );
                      return;

                    }
                    authProvider.cleanControllers();
                    changeScreenReplacement(context, LoginScreen());
                },
                              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      color: red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Register",
                              size: 22,
                              color: white,
                            )
                          ])),
                ),
              ),
            ),
            GestureDetector(
              onTap:(){
                changeScreenReplacement(context, LoginScreen());
              },
              child: CustomText(text: "Login Here",size:20))
          ],
        ),
      ),
    );
  }
}