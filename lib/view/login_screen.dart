import 'package:crud_in_firebase/view/forgot_password_screen.dart';
import 'package:crud_in_firebase/view/home_screen.dart';
import 'package:crud_in_firebase/view/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Login Screen')),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextFormField(
              controller: loginEmailController,
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
              controller: loginPasswordContoller,
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
                var loginEmail = loginEmailController.text.trim();
                var loginPassword = loginPasswordContoller.text.trim();

                try{
                  final User? firebaseUser = (await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: loginEmail, password: loginPassword)).user;
                  if(firebaseUser != null){
                    Get.to(() =>HomeScreen());
                  }else{

                    print("Check your eamil and password");
                  }

                }on FirebaseAuthException catch(e){
                  print('error $e');
                }

              },
              child: Text('Login'),
          ),
          SizedBox(height: 9.h),

          GestureDetector(
            onTap: (){
              Get.to(()=>ForgotPasswordScreen());
            },
            child: Container(
              child: Card(child:
                  Padding(
                    padding:EdgeInsets.all(9.0),
              child: Text('Forgot password'))),

            ),
          ),
          SizedBox(height: 9.h),
          GestureDetector(
            onTap: (){
              Get.to(() => SignupScreen());
            },
            child: Container(
                child:const Card(
                    child: Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Text('Dont have account SignUp')))),
          ),
        ],
      ),

    );
  }
}