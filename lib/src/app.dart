import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pics/src/models/image_model.dart';
import 'package:pics/src/widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> imageModels = [];
  void fetchImage() async {
    counter++;
    var response = await get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter"));
    var imageModel = ImageModel.fromJson(jsonDecode(response.body));
    setState(() {
    imageModels.add(imageModel);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('This is my new App'),
        ),
        body: ImageList(imageModels),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
