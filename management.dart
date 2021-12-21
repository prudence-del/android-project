import 'package:chitchat/Authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

// ignore: camel_case_types
class _ProjectState extends State<Project> {
  bool valuefirst = false;
  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      // image:  DecorationImage(image:  AssetImage("images/logo 1.png"), fit: BoxFit.cover,),
                      ),
                  child:
                      Image.asset("images/logo1.png", height: 200, width: 200),
                ),
                TextField(
                  controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Username or Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                const SizedBox(height: 25.0),
                TextField(
                  controller: passwordController,
                    decoration: InputDecoration(
                        hintText: 'password',
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
              const  SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text(
                      'Remember me',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Checkbox(
                      value: valuefirst,
                      onChanged: (value) {
                        setState(() {
                          if (valuefirst) {
                            valuefirst = value!;
                          } else {
                            valuefirst = value!;
                          }
                        });
                      },
                    ),
                    RaisedButton(onPressed:(){
                      Authentication().signIn(emailController.text.trim(), passwordController.text.trim());
                      // context.read<Authentication>().signIn(
                      //   email:emailController.text.trim(),
                      //   password: passwordController.text.trim()
                      // );
                    },
                    child: Text("Sign in"),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
