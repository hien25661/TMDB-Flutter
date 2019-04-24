import 'package:flutter/material.dart';
import 'package:flutter_tmdb/blocs/tv_bloc.dart';
import 'package:flutter_tmdb/models/tv.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:flutter_tmdb/resources/utils.dart';
import 'package:flutter_tmdb/ui/movie/search_movie_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tmdb/ui/helper/custom_page_route.dart';
import 'package:flutter_tmdb/ui/widget/network_image.dart';

// ignore: must_be_immutable
class TVTabScreen extends StatelessWidget {
  int _indexTab;

  TVTabScreen(this._indexTab);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch (_indexTab) {
      case 1:
        tvBloc.fetchAllTvAiringToday();
        break;
      case 2:
        tvBloc.fetchAllTvOnTheAir();
        break;
      case 3:
        tvBloc.fetchAllTvPopular();
        break;
      case 4:
        tvBloc.fetchAllTvTopRated();
        break;
      default:
        break;
    }
    if (_indexTab < 5) {
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
    } else {
      return new Container();
    }
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
