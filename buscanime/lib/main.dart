import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:buscanime/jikan_api.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyTextInput(),
  ));
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  final TextEditingController controller = new TextEditingController();
  var busqueda;
  var nombre;
  int result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("barra"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Type"),
              onSubmitted: (String str) async {
                setState(() {
                  id(str).then((value) {
                    result = value;
                  });
                });
                controller.text = "";
              },
              controller: controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(result);
        },
      ),
    );
  }
}

Future<BuiltList<Search>> buscar(String str) async {
  var jikan = Jikan();
  var busqueda = await jikan.search(str, SearchType.anime);
  return busqueda;
}

Future<int> id(String str) async {
  var a = await buscar(str);
  return a.first.malId;
}
// holaaaaaaaaaaa
