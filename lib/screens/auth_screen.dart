import 'package:flutter/material.dart';
//import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/widgets/auth_form.dart';
class AuthScreen  extends StatefulWidget {
  

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth=FirebaseAuth.instance;
  void _submitAuthForm(
    String email,
    String password,
    String  username,
    bool isLogin,
    BuildContext ctx    
    )async{
      UserCredential authResult;
      try {if(isLogin){
      authResult=await _auth.signInWithEmailAndPassword(email: email, password: password);
      }else{
        authResult=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }
  
  }on PlatformException catch(err){
    var msg='An error occurred please check out your credentials';
    if(err.message!=null){
      msg=err.message;
    }
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).errorColor,
        ),
      
    );
  }catch(err){
    print(err);
  }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
      
    );
  }
}

