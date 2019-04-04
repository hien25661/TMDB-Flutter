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

  _MovieDetailState(this._movie);

  @override
  Widget build(BuildContext context) {
    final SliverAppBar appBar = new SliverAppBar(
      title: Text(_movie.title),
      backgroundColor: Colors.blueGrey,
    );
    final widget = buildTopView(context);

    final Column parent = new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[],
    );

    final NestedScrollView nestedScrollView = new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[appBar];
        },
        body: parent);

    final Scaffold scaffold = new Scaffold(
      body: nestedScrollView,
    );

    return scaffold;
  }

  Widget buildTopView(BuildContext context) {
    return Container();
  }
}
