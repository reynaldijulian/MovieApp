import 'package:flutter/material.dart';
import 'package:movie/nav_drawer.dart';

class UpcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming"),
      ),
      //NOTE: drawer sebelah kiri
      drawer: DrawerWidget(),
      //NOTE: drawer sebelah kanan
      //endDrawer: DrawerWidget(),
      body: Center(
        child: Text(
          'Upcoming',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
