import 'package:flutter/material.dart';
import 'package:flutter_tmdb/resources/enum.dart';
import 'package:flutter_tmdb/ui/actor/actor_tab_screen.dart';
import 'package:flutter_tmdb/ui/movie/movie_tab_screen.dart';
import 'package:flutter_tmdb/ui/tv/tv_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new PlaceHolderWidget(tab: HomeTab.MOVIES),
    new PlaceHolderWidget(tab: HomeTab.TV),
    new PlaceHolderWidget(tab: HomeTab.ACTOR),
    new PlaceHolderWidget(tab: HomeTab.MORE)
  ];
  BuildContext mContext;

  final List<String> _titles = ["Movies", "TV Shows", "Popular Actors"];

  @override
  Widget build(BuildContext context) {
    mContext = context;
    final Drawer drawer = new Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              "Movie-TV Show Guide",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(
                "H",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          ListTile(
            title: Text("Login to TMDB"),
            leading: Icon(Icons.turned_in),
          ),
          ListTile(
            title: Text("Discover Movies"),
            leading: Icon(Icons.search),
          ),
          ListTile(
            title: Text("Discover Tv Shows"),
            leading: Icon(Icons.search),
          ),
          ListTile(
            title: Text("Genre"),
            leading: Icon(Icons.local_movies),
          ),
          ListTile(
            title: Text("Favorite"),
            leading: Icon(Icons.favorite),
          )
        ],
      ),
    );

    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('Movies'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            title: Text('TV'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Actors')),
          new BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), title: Text('More'))
        ]);

    Scaffold scaffold = new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            _titles[_currentIndex > 2 ? _currentIndex - 1 : _currentIndex]),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.view_list),
          )
        ],
      ),
      drawer: drawer,
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
    return scaffold;
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print(index.toString());
    });
    // Show Slide menu when tapped to More
    if (index == 3) {
      Scaffold.of(mContext).openDrawer();
    }
  }
}

//==
class PlaceHolderWidget extends StatelessWidget {

  final HomeTab tab;

  PlaceHolderWidget({Key key, this.tab}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case HomeTab.MOVIES:
        return new MovieTab();
      case HomeTab.TV:
        return new TVShowTab();
      case HomeTab.ACTOR:
        return new ActorTab();
      case HomeTab.MORE:
        return new ActorTab();
    }
    return Container();
  }
}

//=========================================================

class MovieTab extends StatelessWidget {
  const MovieTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = new List();

    tabs.add(Tab(text: "NOW PLAYING"));
    tabs.add(Tab(text: "POPULAR"));
    tabs.add(Tab(text: "UPCOMMING"));
    tabs.add(Tab(text: "TOP RATED"));
    tabs.add(Tab(text: "MOVIE BY YEAR"));

    final TabBar tabBar = new TabBar(
      isScrollable: true,
      indicatorColor: Colors.amber,
      labelColor: Colors.white70,
      unselectedLabelColor: Colors.white,
      tabs: tabs,
      indicatorSize: TabBarIndicatorSize.tab,
    );

    final TabBarView tabBarView = new TabBarView(
      children: <Widget>[
        new MovieTabScreen(movieApiType: MovieApiType.NOW_PLAYING),
        new MovieTabScreen(movieApiType: MovieApiType.POPULAR),
        new MovieTabScreen(movieApiType: MovieApiType.UPCOMING),
        new MovieTabScreen(movieApiType: MovieApiType.TOP_RATED),
        new MovieTabScreen(movieApiType: MovieApiType.MOVIE_BY_YEAR),
      ],
    );

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            color: Colors.blueGrey,
            height: 50.0,
            child: tabBar,
          ),
        ),
        body: tabBarView,
      ),
    );
  }
}

//=========================================================

class TVShowTab extends StatelessWidget {
  const TVShowTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = new List();
    tabs.add(Tab(text: "AIRING TODAY"));
    tabs.add(Tab(text: "ON THE AIR"));
    tabs.add(Tab(text: "POPULAR"));
    tabs.add(Tab(text: "TOP RATED"));

    final TabBar tabBar = new TabBar(
      isScrollable: true,
      indicatorColor: Colors.amber,
      labelColor: Colors.white70,
      unselectedLabelColor: Colors.white,
      tabs: tabs,
      indicatorSize: TabBarIndicatorSize.tab,
    );

    final TabBarView tabBarView = new TabBarView(
      children: <Widget>[
        new TVTabScreen(tvShowApiType: TvShowApiType.Airing_Today),
        new TVTabScreen(tvShowApiType: TvShowApiType.On_The_Air),
        new TVTabScreen(tvShowApiType: TvShowApiType.POPULAR),
        new TVTabScreen(tvShowApiType: TvShowApiType.TOP_RATED),
      ],
    );

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            color: Colors.blueGrey,
            height: 50.0,
            child: tabBar,
          ),
        ),
        body: tabBarView,
      ),
    );
  }
}

//=========================================================

class ActorTab extends StatelessWidget {
  const ActorTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActorTabScreen();
  }
}
