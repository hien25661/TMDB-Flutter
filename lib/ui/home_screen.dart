import 'package:flutter/material.dart';
import 'package:flutter_tmdb/ui/movie/movie_tab_screen.dart';
import 'package:flutter_tmdb/ui/tv/tv_tab_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new PlaceHolderWidget(Colors.white, 0),
    new PlaceHolderWidget(Colors.deepOrange, 1),
    new PlaceHolderWidget(Colors.green, 2),
    new PlaceHolderWidget(Colors.amber, 3)
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
  final Color color;
  final int _currentIndex;

  PlaceHolderWidget(this.color, this._currentIndex);

  @override
  Widget build(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        return new MovieTab(currentIndex: 0);
      case 1:
        return new TVShowTab();
      case 2:
        return new ActorTab();
      default:
        return new ActorTab();
    }
  }
}

//=========================================================

class MovieTab extends StatelessWidget {
  const MovieTab({
    Key key,
    @required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int _currentIndex;

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
        new MovieTabScreen(1),
        new MovieTabScreen(2),
        new MovieTabScreen(3),
        new MovieTabScreen(4),
        new MovieTabScreen(5),
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
        new TVTabScreen(1),
        new TVTabScreen(2),
        new TVTabScreen(3),
        new TVTabScreen(4),
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
    return new Container(child: new Text('Actor'));
  }
}
