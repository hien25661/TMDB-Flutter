import 'package:flutter/material.dart';
import 'package:flutter_tmdb/resources/app_constant.dart';
import 'package:flutter_tmdb/resources/enum.dart';
import 'package:flutter_tmdb/resources/utils.dart';
import 'package:flutter_tmdb/ui/movie/movie_tab_screen.dart';

class MovieSearch extends StatefulWidget {
  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  int currentYear;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String year in years) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(value: year,
          child: SizedBox(
            child: Text(year),
          )));
    }
    return items;
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    currentYear = int.parse(_dropDownMenuItems[0].value.trim());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Center dropDown = Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new DropdownButton(
              value: currentYear.toString(),
              items: _dropDownMenuItems,
              onChanged: changeYearItem,
            )
          ],
        ));
    final ListView listView = ListView(
      children: <Widget>[
        dropDown,
        Container(
          height: getScreenHeight(context),
          child:  MovieTabScreen(movieApiType: MovieApiType.TOP_RATED),
        )
      ],
    );
    return new Container(
      color: Colors.white,
      child: listView
    );
  }

  void changeYearItem(String value) {
    setState(() {
      currentYear = int.parse(value);
      print(currentYear.toString());
    });
  }
}
