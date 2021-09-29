import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/movie_model.dart';
import 'package:movie/nav_drawer.dart';
import 'package:movie/pages/find_page.dart';
import 'package:movie/pages/movie_detail_page.dart';
import 'package:movie/provider/api_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiProvider apiProvider = ApiProvider();
  Future<MovieModel> movieModel1, movieModel2, movieModel3, movieModel4;
  String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  @override
  void initState() {
    movieModel1 = apiProvider.getNowPlaying();
    movieModel2 = apiProvider.getTopRated();
    movieModel3 = apiProvider.getPopular();
    movieModel4 = apiProvider.getUpcoming();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context)
          //.push(MaterialPageRoute(builder: (context) => FindPage()));
        },
        child: Icon(
          Icons.search,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
              bottom: 30,
            ),
            child: Text(
              'Now Playing',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          nowPlaying(),
          Container(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
              bottom: 30,
            ),
            child: Text(
              'Top Rated',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          topRated(),
          Container(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
              bottom: 30,
            ),
            child: Text(
              'Popular',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          popular(),
          Container(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
              bottom: 30,
            ),
            child: Text(
              'Upcoming',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          upcoming(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget nowPlaying() {
    return FutureBuilder(
      future: movieModel1,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print("Has Data: ${snapshot.hasData}");
          return Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.results.length,
              itemBuilder: (BuildContext context, int index) {
                return moviesItem(
                    poster:
                        '$imageBaseUrl${snapshot.data.results[index].posterPath}',
                    title: '${snapshot.data.results[index].title}',
                    date: '${snapshot.data.results[index].releaseDate}',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                movie: snapshot.data.results[index],
                              )));
                    });
              },
            ),
          );
        } else if (snapshot.hasError) {
          print("Has Error: ${snapshot.hasError}");
          return Text('Error!!!');
        } else {
          print("Loading...");
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget topRated() {
    return FutureBuilder(
      future: movieModel2,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print("Has Data: ${snapshot.hasData}");
          return Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.results.length,
              itemBuilder: (BuildContext context, int index) {
                return moviesItem(
                    poster:
                        '$imageBaseUrl${snapshot.data.results[index].posterPath}',
                    title: '${snapshot.data.results[index].title}',
                    date: '${snapshot.data.results[index].releaseDate}',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                movie: snapshot.data.results[index],
                              )));
                    });
              },
            ),
          );
        } else if (snapshot.hasError) {
          print("Has Error: ${snapshot.hasError}");
          return Text('Error!!!');
        } else {
          print("Loading...");
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget popular() {
    return FutureBuilder(
      future: movieModel3,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print("Has Data: ${snapshot.hasData}");
          return Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.results.length,
              itemBuilder: (BuildContext context, int index) {
                return moviesItem(
                    poster:
                        '$imageBaseUrl${snapshot.data.results[index].posterPath}',
                    title: '${snapshot.data.results[index].title}',
                    date: '${snapshot.data.results[index].releaseDate}',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                movie: snapshot.data.results[index],
                              )));
                    });
              },
            ),
          );
        } else if (snapshot.hasError) {
          print("Has Error: ${snapshot.hasError}");
          return Text('Error!!!');
        } else {
          print("Loading...");
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget upcoming() {
    return FutureBuilder(
      future: movieModel4,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print("Has Data: ${snapshot.hasData}");
          return Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.results.length,
              itemBuilder: (BuildContext context, int index) {
                return moviesItem(
                    poster:
                        '$imageBaseUrl${snapshot.data.results[index].posterPath}',
                    title: '${snapshot.data.results[index].title}',
                    date: '${snapshot.data.results[index].releaseDate}',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                movie: snapshot.data.results[index],
                              )));
                    });
              },
            ),
          );
        } else if (snapshot.hasError) {
          print("Has Error: ${snapshot.hasError}");
          return Text('Error!!!');
        } else {
          print("Loading...");
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget moviesItem({
    String poster,
    String title,
    String date,
    Function onTap,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0.0,
              child: CachedNetworkImage(
                imageUrl: poster,
                fit: BoxFit.fill,
                width: 140.0,
                height: 170.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 7,
              ),
              child: Text(
                title.length > 13 ? title.substring(0, 10) + '...' : title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 7,
              ),
              child: Text(date),
            ),
          ],
        ),
      ),
    );
  }
}
