import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class MessageBubble  extends StatelessWidget {
  final Key key;
  final String message;
  final String userId;
  final bool isMe;
    MessageBubble(this.message,this.userId,this.isMe,{this.key});
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end:MainAxisAlignment.start,
      children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color:isMe? Colors.grey[300]: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: !isMe? Radius.circular(0):Radius.circular(12),
            bottomRight: isMe?Radius.circular(0):Radius.circular(12),
          ),
        ),
        width: 140,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16
        ),
        margin: EdgeInsets.symmetric(
          vertical: 4,horizontal: 8
          ),
        child:Column(
          crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
          children:<Widget>[
            FutureBuilder(
              future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
              builder:(context,snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Text('waiting');
                }
               return Text(
                snapshot.data['username'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe
                  ? Colors.black
                  :Theme.of(context).accentTextTheme.title.color,
                ),
              );
              },
            ),
           Text(message,
          style:TextStyle(
            color:isMe? Colors.black: Theme.of(context).accentTextTheme.title.color,
          
          ),
          textAlign: isMe?TextAlign.end:TextAlign.start,
          ),
          ],
          ) ,
        
      ),
      ]
      );
  }
}