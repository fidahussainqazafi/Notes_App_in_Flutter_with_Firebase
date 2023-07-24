import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_in_firebase/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/signup_services.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userphoneController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Signup Screen')),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: useremailController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 9.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'UserName',
               // prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 9.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: userphoneController,
              decoration: InputDecoration(
                hintText: 'phone ',
                prefixIcon: Icon(Icons.phone),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 9.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: userpasswordController,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () async{
              var userpassword = userpasswordController.text.trim();
              var userName = usernameController.text.trim();
              var userPhone =  userphoneController.text.trim();
              var userEmail = useremailController.text.trim();

              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                   email: userEmail, password: userpassword).then((value) => {

                singupUser(
               userName,
               userPhone,
               userEmail,
              userpassword,
    ),
    });




            },
            child: Text('Signup'),
          ),
          SizedBox(height: 9.h),

          SizedBox(height: 9.h),
          GestureDetector(
            onTap: (){
              Get.to(()=>LoginScreen());
            },
            child: Container(
                child:const Card(
                    child: Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Text('Already have account Login')))),
          ),
        ],
      ),

    );
  }
}