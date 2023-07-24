import 'package:crud_in_firebase/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'models/signup_model.dart';
import 'services/auth_services.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('SignUp'),

      ),
      body: Column(
        children: [
          Text("Create New Account"),
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

              Container(


                width: 280,
                height: 90,
                child: TextFormField(

                  controller: confirmpassword,

                  decoration: const InputDecoration(
                    hintText: 'confirmpassword',

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

            ],
          ),
          Column(
            children: [
              ElevatedButton(onPressed: () {
                if (password.text.isEmpty || email.text.isEmpty ||
                    confirmpassword.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('All Fields are Reqiured')));
                } else if (password.text != confirmpassword.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('password does not match')));
                }
                else {
                  UserSignUpModel user = UserSignUpModel(
                      userId: ' ',
                      email: email.text,
                      password: password.text);

                  Firebase_Auth().signUp(user);

                  Get.to(() => SignIn());
                }


                }, child: Text('Next'),
                )
            ],
          )
        ],
      ),

    );
  }
}
