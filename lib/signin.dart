import 'package:crud_in_firebase/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'services/auth_services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn'),
      ),
      body: Column(
          children: [
          Text("Sign In Account"),
      Column(

        children: [
      Center(

      child: Container(

      width: 280,
        height: 90,
        child: TextFormField(

          controller: email,

          decoration: const InputDecoration(
            hintText: 'demo@gmail.com',
            prefixIcon:  Icon(Icons.send,color: Colors.white,),
            filled: true,
            fillColor: Colors.grey,
            hintStyle:  TextStyle(color: Colors.white),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.vertical(),
                borderSide: BorderSide(color: Colors.black38)
            ),

          ),

        ),
      ),
    ),
    SizedBox(
    height: 20,
    ),
    Container(

    width: 280,
    height: 90,
    child: TextFormField(

    controller: password,

    decoration: const InputDecoration(
    hintText: 'password',

    filled: true,
    fillColor: Colors.grey,
    hintStyle:  TextStyle(color: Colors.white),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.vertical(),
    borderSide: BorderSide(color: Colors.black38)
    ),

    ),

    ),
    ),

    ]
      ),

        ElevatedButton(onPressed: ()async {
          if (email.text.isEmpty || password.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('All fields are required '),
              ),
            );
          } else {
            final user = await Firebase_Auth().signIn(email.text, password.text);

            if (user != null) {
              //Get.to(() => HomePage());
            }
          }




        }, child: Text('Go to Home Page'),

        )
    ]
      )
    );
  }
}


