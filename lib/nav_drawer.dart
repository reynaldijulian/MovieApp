import 'package:flutter/material.dart';
import 'package:movie/pages/about_page.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/now_playing_page.dart';
import 'package:movie/pages/top_rated_page.dart';
import 'package:movie/pages/upcoming_page.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              print('Tap Home');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          _drawerItem(
            icon: Icons.play_circle_fill_outlined,
            text: 'Now Playing',
            onTap: () {
              print('Tap Now Playing');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => NowPlayingPage(),
                ),
              );
            },
          ),
          _drawerItem(
            icon: Icons.arrow_upward,
            text: 'Top Rated',
            onTap: () {
              print('Tap Top Rated');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => TopRatedPage(),
                ),
              );
            },
          ),
          _drawerItem(
            icon: Icons.playlist_add_check_rounded,
            text: 'Upcoming',
            onTap: () {
              print('Tap Upcoming');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => UpcomingPage(),
                ),
              );
            },
          ),
          Divider(height: 25, thickness: 1),
          /*Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),*/
          _drawerItem(
            icon: Icons.bookmark,
            text: 'About',
            onTap: () {
              print('Tap About');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
          image: AssetImage('assets/image_profile.png'), fit: BoxFit.cover),
    ),
    /*otherAccountsPictures: [
      ClipOval(
        child: Image(
            image: AssetImage('assets/image_profile.png'), fit: BoxFit.cover),
      ),
      ClipOval(
        child: Image(
            image: AssetImage('assets/image_profile.png'), fit: BoxFit.cover),
      )
    ],*/
    accountName: Text('Movie Pro'),
    accountEmail: Text('your movies app list'),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
