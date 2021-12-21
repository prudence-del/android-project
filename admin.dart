import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  var firestore = FirebaseFirestore.instance;
  add() {
    firestore
        .collection('stds')
        .doc(stdclass)
        .collection("students")
        .doc()
        .set({
      'Name': a.text,
      'adm': b.text,
      'pname': c.text,
      'pno': d.text,
    }).then((value) {
      a.clear();
      b.clear();
      c.clear();
      d.clear();
      Navigator.of(context).pop();
    });
  }

  String stdclass = 'class 1';
  changeClass() {
    setState(() {
      if (stdclass == 'class 2') {
        stdclass = 'class 1';
      } else {
        stdclass = "class 2";
      }
    });
  }
GlobalKey<FormState>_formkey = GlobalKey<FormState>();
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();
  String val = '1';
  List items = ['1', '2'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: DropdownButton<String>(
              value: val,
              onChanged: (newValue) {
                setState(() {
                  val = newValue.toString();
                });
                changeClass();
              },
              items: items.map<DropdownMenuItem<String>>((e) {
                return DropdownMenuItem<String>(
                    value: e, child: Text('class $e'));
              }).toList()),
          actions: [
            IconButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    return value!.isEmpty?'name cannot be empty':null;
                                  },
                                  controller: a,
                                  decoration: const InputDecoration(
                                    hintText: 'Name ',
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    return value!.isEmpty?'adm cannot be empty':null;
                                  },
                                  controller: b,
                                  decoration: const InputDecoration(
                                    hintText: 'adm',
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    return value!.isEmpty?'pname cannot be empty':null;
                                  },
                                  controller: c,
                                  decoration: const InputDecoration(
                                    hintText: 'pname',
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    return value!.isEmpty?'phone cannot be empty':null;
                                  },
                                  controller: d,
                                  decoration: const InputDecoration(
                                    hintText: 'phone number',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("exit")),
                            TextButton(
                                onPressed: () {
                                  _formkey.currentState!.validate()?add():print('empty');
                                },
                                child: const Text("add student"))
                          ],
                        )),
                icon: const Icon(Icons.add)),
          ]),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('stds')
            .doc(stdclass)
            .collection("students")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ref = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(ref['Name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Adm no.: ${ref["adm"]}'),
                        Text(' Pname.: ${ref["pname"]}'),
                        Text('p_no.: ${ref["pno"]}'),
                        // Text('class.:${ref["class"]}'),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
