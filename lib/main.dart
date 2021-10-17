import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de artistas'),
        ),
        body: Center(
          child: Container(
            child: Text('Teste'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // onPressed: () {
          //   print("ok");
          // },
          // onPressed: adiciona,
          onPressed: listagem,
          // onPressed: refresh,
          // onPressed: altera2,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailin
      ),
    );
  }

  CollectionReference cfArtistas =
      FirebaseFirestore.instance.collection("cadastro_cachorros");

  Future<void> listagem() async {
    await Firebase.initializeApp();

    QuerySnapshot querySnapshot = await cfArtistas.get();

    querySnapshot.docs.forEach((cachorro) {
      print("--------------------------");
      print(cachorro.get("nome"));
      print(cachorro.get("pelagem"));
      print("${cachorro.get('idade')} anos");
    });
  }
}
