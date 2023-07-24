


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_in_firebase/models/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Auth {
  final instance = FirebaseFirestore.instance;


  Future createUserAccount(UserSignUpModel user) async {
    print('I am creating user');
    await instance.collection(UserSignUpTable).doc(user.userId).set(
        user.toJson());
    print('I have created user');
  }


  Future updateUser(UserSignUpModel user) async {
    await instance.collection(UserSignUpTable).doc(user.userId).set(
        user.toJson());
  }

  Future deleteUser(UserSignUpModel user)async{

  await instance.collection(UserSignUpTable).doc(user.userId).delete();
}
  Future signUp(UserSignUpModel user) async {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password);
    user.userId = result.user!.uid;

    createUserAccount(user);
    return result.user;
  }

     Future signIn(String email, String password) async {
       UserCredential result = await FirebaseAuth.instance
           .signInWithEmailAndPassword(
         email: email,
         password: password,
       );
       return result.user;
     }
}