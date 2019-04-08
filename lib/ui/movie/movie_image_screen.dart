import 'package:flutter/material.dart';
import 'package:flutter_tmdb/models/movie.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:flutter_tmdb/ui/widget/network_image.dart';
import 'package:path/path.dart';

class MovieImageWidget extends StatelessWidget {
  final List<MovieImage> images;

  const MovieImageWidget({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: false,
          shrinkWrap: true,
          itemCount: images.length,
          padding: EdgeInsets.all(0.0),
          itemBuilder: (BuildContext mContext, int index) {
            return new Row(
              children: <Widget>[

              ],
            );
          },
    ));
  }
}
