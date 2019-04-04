import 'package:flutter/material.dart';
import 'package:flutter_tmdb/models/movie.dart';

class MovieDetail extends StatefulWidget {
  Movie _movie;


  MovieDetail(this._movie);

  @override
  _MovieDetailState createState() => _MovieDetailState(_movie);
}

class _MovieDetailState extends State<MovieDetail> {
  Movie _movie;
  _MovieDetailState(Movie movie);

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = new AppBar(
      title: Text(_movie.title),
      backgroundColor: Colors.transparent,
    );
    final widget = buildTopView(context);

    final Expanded parent = new Expanded(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

          ],
        ),
    );

    final Scaffold scaffold = new Scaffold(
      appBar: appBar,
      body: ,
    );

    return Container();
  }

  Widget buildTopView(BuildContext context) {

    return Container(
    );
  }

}


