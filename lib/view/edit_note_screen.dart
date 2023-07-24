import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_in_firebase/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNoteScreen extends StatelessWidget {
   EditNoteScreen({Key? key}) : super(key: key);
  TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments['note'].toString()),
      ),
      body: Container(
        child: Column(children: [
          TextFormField(
            controller: editController
            ..text = "${Get.arguments['note'].toString()}",
          ),
          ElevatedButton(
              onPressed: ()async{
              await  FirebaseFirestore.instance.collection("notes").doc(Get.arguments["docId"].toString()).update({
                'note':editController.text.trim(),
              }).then((value) => {
                Get.offAll(()=>HomeScreen()),
              });

              },
              child: Text('Update')),
        ],),
      ),
    );
  }
}
