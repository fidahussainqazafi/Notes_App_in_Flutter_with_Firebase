


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

String UserSignUpTable = 'User Table';

class UserSignUpFields{

  String userId = 'userId';
  String email = 'email';
  String password = 'password';


}
class UserSignUpModel{

  String userId;
  String email;
  String password;

  UserSignUpModel({

    required this.userId,
    required this.email,
    required this.password,
}
  );
  Map<String, Object?> toJson() =>
      {


        UserSignUpFields().userId: userId,
        UserSignUpFields().email: email,
        UserSignUpFields().password: password,
      };
  Map<String, dynamic> toMap() {
    return {


      UserSignUpFields().userId: userId,
      UserSignUpFields().email: email,
      UserSignUpFields().password: password,

    };
  }

    factory UserSignUpModel.fromJson(DocumentSnapshot json) => UserSignUpModel(
      userId:json[UserSignUpFields().userId],

      email: json[UserSignUpFields().email],

      password: json[UserSignUpFields().password],
    );

}