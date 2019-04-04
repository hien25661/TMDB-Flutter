import 'package:flutter/material.dart';
import 'package:flutter_tmdb/blocs/movie_bloc.dart';
import 'package:flutter_tmdb/models/movie.dart';
import 'package:flutter_tmdb/resources/utils.dart';
import 'package:flutter_tmdb/ui/movie/search_movie_screen.dart';

class MovieTabScreen extends StatefulWidget {
  int _indexTab;

  MovieTabScreen(this._indexTab);

  @override
  _MovieTabScreenState createState() => _MovieTabScreenState(_indexTab);
}

class _MovieTabScreenState extends State<MovieTabScreen> {
  int _indexTab;

  _MovieTabScreenState(this._indexTab);

  @override
  Widget build(BuildContext context) {
    switch (_indexTab) {
      case 1:
        movieBloc.fetchAllMoviesNowPlaying();
        break;
      case 2:
        movieBloc.fetchAllMoviesPopular();
        break;
      case 3:
        movieBloc.fetchAllMoviesUpComing();
        break;
      case 4:
        movieBloc.fetchAllMoviesTopRated();
        break;
      default:
        break;
    }
    if (_indexTab < 5) {
      return Container(
        child: StreamBuilder(
            stream: movieBloc.movieList,
            builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
              if (snapshot.hasData) {
                return buildList(context, snapshot);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      );
    } else {
      return MovieSearch();
    }
  }
}


Widget buildList(BuildContext context, AsyncSnapshot<MovieResponse> snapshot) {
  double sizeImageWidth = getScreenWidth(context) / 3.0;
  double sizeImageHeight = 3.0 * sizeImageWidth / 2.0 + 50;

  return GridView.builder(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        childAspectRatio: sizeImageWidth / sizeImageHeight),
    itemBuilder: (BuildContext context, int index) {
      final Movie movie = snapshot.data.results[index];
      final image = Image.network(
        'https://image.tmdb.org/t/p/w500${movie.poster_path}',
        fit: BoxFit.fitWidth,
      );
      final textName = Text(
        movie.title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
      final column = Column(
        children: <Widget>[image, SizedBox(height: 10), textName],
      );
      return column;
    },
    itemCount: snapshot.data.results.length,
  );
}
