import 'package:crud_in_firebase/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController forgotController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Forgot Password')),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: forgotController,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),

          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: ()async{
              var forgotEmail = forgotController.text.trim();
              try{
              await FirebaseAuth.instance.sendPasswordResetEmail(email: forgotEmail).then((value) => {
                  print("Email sent"),
                Get.off(()=> LoginScreen()),
                });

              }on FirebaseAuthException catch(e){
                print('Error $e');
              }
            },
            child: Text('Forgot Password'),
          ),

        ],
      ),

    );
  }
}