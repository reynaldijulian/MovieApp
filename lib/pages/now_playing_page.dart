import 'package:flutter/material.dart';
import 'package:movie/nav_drawer.dart';

class NowPlayingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
      ),
      //NOTE: drawer sebelah kiri
      drawer: DrawerWidget(),
      //NOTE: drawer sebelah kanan
      //endDrawer: DrawerWidget(),
      body: Center(
        child: Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
