
/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_in_firebase/models/signup_model.dart';
import 'package:crud_in_firebase/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),

body:  StreamBuilder(
  stream: FirebaseFirestore.instance.collection(UserSignUpTable).snapshots(),
  builder: (context,AsyncSnapshot<QuerySnapshot> snapshots){
    if(snapshots.hasError){
      return Text('Something Went Wrong');
    }
    if(snapshots.connectionState == ConnectionState.waiting){


    }
    List<UserSignUpModel> userList = [];
    List<String> docIdList = [];

    if(snapshots.hasData){
      for(int i = 0; i< snapshots.data!.docs.length; i++){
        print(snapshots.hasData);

        UserSignUpModel user = UserSignUpModel.fromJson(snapshots.data!.docs[i]);
        userList.add(user);

      }
    }
    return userList.isEmpty? Center(
      child: Text('No User is Available'),
    ):
        ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context,index){
              return  Card(

                child: ListTile(
                  title: Text('user email:${userList[index].email}'),
                  subtitle: Text('password: ${userList[index].password}'),
                  onTap: (){
                    email.text = userList[index].email;
                    password.text = userList[index].password;


      showDialog(
      context: context,
      builder: (context){
     return AlertDialog(
       content: Column(
     children: [
     TextFormField(

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
     TextFormField(

     controller: password,

     decoration: const InputDecoration(
    hintText: 'password',
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

    ],
           ),


     actions: [
       TextButton(onPressed: (){


       Firebase_Auth().updateUser(
        email.text as UserSignUpModel;
           password.text;

           docIdList[index]);

       },
       child: Text('Update User')),

       TextButton(onPressed: (){
         Firebase_Auth().deleteUser(docIdList[index] as UserSignUpModel);
       },
           child: Text('Delete'))
                    ],
     );
                    });





                  },
                ),
              );

    });


  },
),
    );
  }
}
  */

