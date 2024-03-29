import 'package:charity_game/explore/explore_tab.dart';
import 'package:charity_game/home/home_tab.dart';
import 'package:charity_game/more/more_tab.dart';
import 'package:charity_game/utils/strings.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(Strings.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(Strings.explore),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text(Strings.history),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            title: Text(Strings.stats),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(Strings.more),
          )
        ]);
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return HomeTab();
      case 1:
        return ExploreTab();
      case 2:
        return PlaceholderWidget(Strings.history);
      case 3:
        return PlaceholderWidget(Strings.stats);
      case 4:
        return MoreTab();
      default:
        throw 'Unexpected index $_currentIndex';
    }
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String title;

  PlaceholderWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Text(title, style: TextStyle(fontSize: 40)),
    ));
  }
}
