import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_in_firebase/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  singupUser(

    String userName,
    String userPhone,
    String userEmail,
    String userPassword,

) async {
    User ? userid = FirebaseAuth.instance.currentUser;
    try{

  await FirebaseFirestore.instance.collection("Fist user").doc(userid!.uid).set({
"user name " : userName,
'phone nob' : userPhone,
"user email" : userEmail,
 "password" : userPassword,
// 'creaTedAt' : DataTime.now(),
"userId" : userid!.uid,
 }).then((value) => {
   FirebaseAuth.instance.signOut(),
   Get.to(()=>LoginScreen())

  });
} on FirebaseAuthException catch(e) {
print(" print $e");
}
}