import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("mouse party"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const Icon(
                Icons.person_add_alt_1_rounded,
                size: 100.0,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "sign in",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                  ),
                ),
              ),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'email',
                      suffixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
              const SizedBox(height: 10),
              TextField(
                  decoration: InputDecoration(
                      hintText: 'password',
                      suffixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
              const SizedBox(height: 10),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: const Text('Login'),
                    onPressed: () {},
                  )),
              SizedBox(
                height: 500,width: MediaQuery.of(context).size.width,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    Image.asset("images/mouse1.jpg"),
                    Image.asset("images/mouse2.jpg"),
                    Image.asset("images/mouse3.jpg")
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

class Children {}
