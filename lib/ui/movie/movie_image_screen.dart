import 'package:flutter/material.dart';
import 'package:flutter_tmdb/models/movie.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:flutter_tmdb/ui/widget/network_image.dart';

// ignore: must_be_immutable
class MovieImageWidget extends StatelessWidget {
  final List<MovieImage> posterImages;
  final List<MovieImage> backDropImages;

  List<MovieImage> images = new List();


  MovieImageWidget({Key key, this.posterImages, this.backDropImages}) : super(key: key);

  Widget _buildItemImage(BuildContext context, int index){
    return new Container(
      padding: EdgeInsets.all(2.0),
      child: new Container(
        child:  new ImageNetWork('https://image.tmdb.org/t/p/w185${images[index].file_path}',
            imageMoviePosterPlaceHolder),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    images.addAll(posterImages);
    images.addAll(backDropImages);
    int totalImage = this.images.length;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalImage,
        itemBuilder:_buildItemImage
      ),
    );
  }
}
