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
