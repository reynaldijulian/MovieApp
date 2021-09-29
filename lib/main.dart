import 'package:flutter/material.dart';
import 'package:movie/nav_drawer.dart';
import 'package:movie/pages/about_page.dart';
import 'package:movie/pages/find_page.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/now_playing_page.dart';
import 'package:movie/pages/top_rated_page.dart';
import 'package:movie/pages/upcoming_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/now-playing-page': (context) => NowPlayingPage(),
        '/top-rated-page': (context) => TopRatedPage(),
        '/upcoming-page': (context) => UpcomingPage(),
        '/about-page': (context) => AboutPage(),
        '/nav': (context) => DrawerWidget(),
        //'/find': (context) => FindPage(),
      },
    );
  }
}
