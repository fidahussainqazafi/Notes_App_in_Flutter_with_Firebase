import 'package:crud_in_firebase/homepage.dart';
import 'package:crud_in_firebase/listviewbuilder.dart';
import 'package:crud_in_firebase/signup.dart';
import 'package:crud_in_firebase/view/home_screen.dart';
import 'package:crud_in_firebase/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 User? user;
 @override
  void initState() {

    super.initState();
    user = FirebaseAuth.instance.currentUser;

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(344,890),
        minTextAdapt: true,
        builder: (context , child){
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home:user != null ?const  HomeScreen() : LoginScreen(),
    );
  }
    );
  }
}
