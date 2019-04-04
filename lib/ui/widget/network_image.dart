import 'package:flutter/material.dart';
class ImageNetWork extends StatelessWidget {
  final String imageUrl;

  ImageNetWork(this.imageUrl);

  @override
  Widget build(BuildContext context) {
      return new FadeInImage(image: new NetworkImage(imageUrl),
              placeholder: new AssetImage("images/movie_place_holder.png"));
  }
}
