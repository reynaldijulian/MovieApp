import 'package:flutter/material.dart';
import 'package:movie/nav_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      //NOTE: drawer sebelah kiri
      drawer: DrawerWidget(),
      //NOTE: drawer sebelah kanan
      //endDrawer: DrawerWidget(),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
