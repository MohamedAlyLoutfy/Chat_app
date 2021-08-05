

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class ChatScreen  extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx,index)=>Container(
          padding: EdgeInsets.all(8),
          child: Text('This Works'),
          
          ),
        
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
         // Firebase.initializeApp();
        FirebaseFirestore.instance
         .collection('chats/NKZhi2vFepIJBSMiYyyg/messages')
        .get()
        .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            print(doc["text"]);
        });
    });
          
          
          // FirebaseFirestore.instance.
          // collection('chats/NKZhi2vFepIJBSMiYyyg/messages')
          // .snapshots()
          // .listen((data) { 
            //data.documents.forEach((document){
             //  print (document['text']);
            //
            //
            //});
            
          //   
          // });
          
          

        },
      
      
      ),
    );
  }
}