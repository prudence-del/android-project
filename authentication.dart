
import 'package:chitchat/homepage.dart';
import 'package:chitchat/management.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
handleAuth(){
  return StreamBuilder(stream: _firebaseAuth.authStateChanges(),builder:(context,snapshot){
   if (snapshot.hasData) {
      return const HomePage();
   } else {
      return const Project();
   }
  } ,);
}
  Stream get authStateChanges =>_firebaseAuth.authStateChanges();
  Future  signIn(  email,   password) async{
  try {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return "signedin";
  }
  on FirebaseAuthException catch(e){
print(e.message);
  }
  }
signout(){
  _firebaseAuth.signOut();
}
Future signup({ String? email,  String? password}) async{
  try {
    await _firebaseAuth.signInWithEmailAndPassword(email: email!, password: password!);
    return "signedup";
  }
  on FirebaseAuthException catch(e){
print(e.message);
  }
}
}