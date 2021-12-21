import 'dart:ui';

import 'package:chitchat/admin.dart';
import 'package:chitchat/authentication.dart';
import 'package:chitchat/parent.dart';
import 'package:chitchat/students.dart';
import 'package:chitchat/teachers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              IconButton(icon: Icon(Icons.account_circle), onPressed: () => {}),
          actions: <Widget>[
            TextButton(
              
                child: const Text(
                  "signout",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Authentication().signout();
                }),
          ],
          centerTitle: true,
          title: const Text("Home"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Colors.greenAccent,
                  Colors.blueAccent,
                ])),
          ),
        ),
        body: Center(
            child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Admin()));
                    },
                    child: Card(
                      
                                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                                  color: Colors.white70,
                                  elevation: 10,
                                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/admin.png',height: 100.0,),
                        const Text('Admin')
                      ],
                    ),
                                  ),
                                ),
                  ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Students()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.white70,
                  elevation: 10,
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('images/students.jpg'),
                        const Text('Students')
                      ],
                    ),
                  ),
                ),
              ),
              
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Teachers()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.white70,
                  elevation: 10,
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset('images/teacher.jpg'),
                        const Text('Teacher')
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap:(){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Teachers()));
                },
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Parents()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.white70,
                    elevation: 10,
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset('images/parents.jpg'),
                          const Text('Parent')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
