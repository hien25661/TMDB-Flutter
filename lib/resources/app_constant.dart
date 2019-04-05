//const
final String imageMoviePosterPlaceHolder = "images/movie_place_holder.png";
final String imageMovieBackDropPlaceHolder =
    "images/movie_backdrop_movie_place_holder.png";

final List<String> years = [
  "2019",
  "2018",
  "2017",
  "2016",
  "2015",
  "2014",
  "2013",
  "2012",
  "2011",
  "2010"
];

final _apiKey = 'bf3adb6587aeecadb0fb4719e5ad97b5';

//Movie Api
final String nowPlayingApi =
    "http://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey";
final String popularApi =
    "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey";
final String upComingApi =
    "http://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey";
final String topRatedApi =
    "http://api.themoviedb.org/3/movie/top_rated?api_key=$_apiKey";

String movieImageApi(int movieId) {
  return "http://api.themoviedb.org/3/movie/$movieId/image?api_key=$_apiKey";
}
//==============================================================================
//TV Api
final String tvAiringTodayApi =
    "http://api.themoviedb.org/3/tv/airing_today?api_key=$_apiKey";
final String tvOnTheAirApi =
    "http://api.themoviedb.org/3/tv/on_the_air?api_key=$_apiKey";
final String tvPopularApi =
    "http://api.themoviedb.org/3/tv/popular?api_key=$_apiKey";
final String tvTopRatedApi =
    "http://api.themoviedb.org/3/tv/top_rated?api_key=$_apiKey";
