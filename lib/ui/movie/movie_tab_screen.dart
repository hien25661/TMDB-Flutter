import 'package:flutter/material.dart';
import 'package:flutter_tmdb/blocs/movie_bloc.dart';
import 'package:flutter_tmdb/models/movie.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:flutter_tmdb/resources/utils.dart';
import 'package:flutter_tmdb/ui/movie/movie_detail_screen.dart';
import 'package:flutter_tmdb/ui/movie/search_movie_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tmdb/ui/helper/custom_page_route.dart';
import 'package:flutter_tmdb/ui/widget/network_image.dart';

class MovieTabScreen extends StatelessWidget {
  int _indexTab;

  MovieTabScreen(this._indexTab);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

  openDetailMoviePage(Movie movie) {
    print(movie.title);
    Navigator.push(context, FadeTransactionPageRoute(new MovieDetail(movie)));
  }

  return GridView.builder(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        childAspectRatio: sizeImageWidth / sizeImageHeight),
    itemBuilder: (BuildContext context, int index) {
      final Movie movie = snapshot.data.results[index];
      final image = new ImageNetWork(
          'https://image.tmdb.org/t/p/w500${movie.poster_path}',
          imageMoviePosterPlaceHolder);
      final textName = Text(
        movie.title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
      final column = Column(
        children: <Widget>[image, SizedBox(height: 10), textName],
      );

      final GestureDetector gestureDetector = new GestureDetector(
        onTap: () => openDetailMoviePage(movie),
        child: column,
      );
      return gestureDetector;
    },
    itemCount: snapshot.data.results.length,
  );
}
