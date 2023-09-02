import 'package:flutter/material.dart';
import 'package:pics/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);
  Widget build(context) {
    return (ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return buildImage(images[index]);
      },
    ));
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(
        width: 2.0,
      )),
      child: Column( 
        children: <Widget>[Padding(padding: const EdgeInsets.only(bottom:8.0,),child:  Image.network(image.url),), Text(image.title)],
      ),
    );
  }
}
