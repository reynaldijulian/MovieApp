import 'package:flutter/material.dart';
import 'package:movie/nav_drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      //NOTE: drawer sebelah kiri
      drawer: DrawerWidget(),
      //NOTE: drawer sebelah kanan
      //endDrawer: DrawerWidget(),
      body: Center(
        child: Text(
          'About',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
