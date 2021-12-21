import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String action = "";
  change() {
    setState(() {
      if (action == "shoot") {
        action = "excuse!!";
      } else {
        action = "shoot";
      }
    });
  }

  String click = 'clickme';
  String ngongos = "kingston mhesh";
  execute() {
    setState(() {
      if (ngongos == "kingston mhesh") {
        ngongos = "scoobydoo";
      } else {
        ngongos = "kingston mhesh";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(action),
      ),
      body: Center(
        child: Column(children: [
          Text(
            ngongos,
            style: const TextStyle(fontSize: 24.0, color: Colors.orange),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                 
                  if (click == "kingston mhesh") {
                    click="click me";
                  }
                  else{
                    click="kingston mhesh";                  }
                });
              },
              child: Text(
                click,
                style: TextStyle(fontSize: 24.0, color: Colors.orange),
              ))
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 25.0,
                height: 35.0,
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  change();
                },
              ),
              const SizedBox(width: 80.0),
              IconButton(
                icon: const Icon(Icons.account_tree),
                onPressed: () {
                  execute();
                },
              ),
              const SizedBox(width: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
