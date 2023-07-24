import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_in_firebase/view/edit_note_screen.dart';
import 'package:crud_in_firebase/view/login_screen.dart';
import 'package:crud_in_firebase/view/notes_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User?userId = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Get.off(()=>LoginScreen());
            },
            child: Icon(Icons.logout_outlined),
          )
        ],
        title: Text('Home Screen'),
      ),

      body: Container(

        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("notes").where("userId", isEqualTo: userId?.uid).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Text("something went wrong");
            }

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CupertinoActivityIndicator());
            }
            if(snapshot.data!.docs.isEmpty){
              return Center(child: Text("Not Data Found"));
            }
            if(snapshot!= null && snapshot.data!=null){

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    var note = snapshot.data!.docs[index]['userId'];
                    var noteId = snapshot.data!.docs[index]['userId'];
                    var docId = snapshot.data!.docs[index]['userId'];
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index]['note']),
                      subtitle: Text(noteId),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: (){

                                 Get.to(()=>EditNoteScreen(),
                                  arguments:{
                                   'note':note,
                                   'docId':docId,
                                  }
                                 );
                                },
                                child: Icon(Icons.edit)),
                            SizedBox(width: 9.w),

                            GestureDetector(
                                onTap: ()async{

                                  await FirebaseFirestore.instance.collection("notes").doc(docId).delete();
                                },

                                child: Icon(Icons.delete)),
                          ],
                        ),

                      ),);
                  }
              );
            }
            return Container();
          },
        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        Get.to(()=>NoteScreen());
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
