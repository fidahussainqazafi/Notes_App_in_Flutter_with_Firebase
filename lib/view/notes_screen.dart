import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController noteController = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 9.0),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                controller: noteController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Add Note',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: ()async{

                  var note = noteController.text.trim();
                  if(note != " "){
                    try{
                      await FirebaseFirestore.instance.collection("notes").doc().set({
                        "Note" : note,
                        "UserId" : userId?.uid,
                      });
                      
                    } catch(e){
                      print("Error $e");
                    }

                  }
                },
                child: Text('Add Note'),

            )],
        ),
      ),
    );
  }
}
