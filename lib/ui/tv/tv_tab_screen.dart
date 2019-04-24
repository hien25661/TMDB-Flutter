import 'package:flutter/material.dart';
import 'package:flutter_tmdb/blocs/tv_bloc.dart';
import 'package:flutter_tmdb/models/tv.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:flutter_tmdb/resources/enum.dart';
import 'package:flutter_tmdb/resources/utils.dart';
import 'package:flutter_tmdb/ui/movie/search_movie_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tmdb/ui/helper/custom_page_route.dart';
import 'package:flutter_tmdb/ui/widget/network_image.dart';

// ignore: must_be_immutable
class TVTabScreen extends StatelessWidget {
  TvShowApiType tvShowApiType;

  TVTabScreen({Key key, this.tvShowApiType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (tvShowApiType) {
      case TvShowApiType.Airing_Today:
        tvBloc.fetchAllTvAiringToday();
        break;
      case TvShowApiType.On_The_Air:
        tvBloc.fetchAllTvOnTheAir();
        break;
      case TvShowApiType.POPULAR:
        tvBloc.fetchAllTvPopular();
        break;
      case TvShowApiType.TOP_RATED:
        tvBloc.fetchAllTvTopRated();
        break;
      default:
        break;
    }
    return Container(
      child: StreamBuilder(
          stream: tvBloc.tvShowList,
          builder: (context, AsyncSnapshot<TvResponse> snapshot) {
            if (snapshot.hasData) {
              return buildList(context, snapshot);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget buildList(BuildContext context, AsyncSnapshot<TvResponse> snapshot) {
  double sizeImageWidth = getScreenWidth(context) / 3.0;
  double sizeImageHeight = 3.0 * sizeImageWidth / 2.0 + 50;

  openDetailMoviePage(Tv tv) {
    print(tv.name);
    //Navigator.push(context, FadeTransactionPageRoute(new MovieDetail(movie)));
  }

  return GridView.builder(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        childAspectRatio: sizeImageWidth / sizeImageHeight),
    itemBuilder: (BuildContext context, int index) {
      final Tv tv = snapshot.data.results[index];
      final image = new ImageNetWork(
          'https://image.tmdb.org/t/p/w500${tv.poster_path}',
          imageMoviePosterPlaceHolder);
      final textName = Text(
        tv.name,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      );
      final column = Column(
        children: <Widget>[image, SizedBox(height: 10), textName],
      );

      final GestureDetector gestureDetector = new GestureDetector(
        onTap: () => openDetailMoviePage(tv),
        child: column,
      );
      return gestureDetector;
    },
    itemCount: snapshot.data.results.length,
  );
}
