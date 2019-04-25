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
final _host = 'http://api.themoviedb.org/3';

//Movie Api
final String nowPlayingApi =
    "$_host/movie/now_playing?api_key=$_apiKey";
final String popularApi =
    "$_host/movie/popular?api_key=$_apiKey";
final String upComingApi =
    "$_host/movie/upcoming?api_key=$_apiKey";
final String topRatedApi =
    "$_host/movie/top_rated?api_key=$_apiKey";

String movieImageApi(int movieId) {
  return "http://api.themoviedb.org/3/movie/$movieId/images?api_key=$_apiKey";
}
//==============================================================================
//TV Api
final String tvAiringTodayApi =
    "$_host/tv/airing_today?api_key=$_apiKey";
final String tvOnTheAirApi =
    "$_host/tv/on_the_air?api_key=$_apiKey";
final String tvPopularApi =
    "$_host/tv/popular?api_key=$_apiKey";
final String tvTopRatedApi =
    "$_host/tv/top_rated?api_key=$_apiKey";

//==============================================================================
//Actor Api
final String actorPopularApi = "$_host/person/popular?api_key=$_apiKey";