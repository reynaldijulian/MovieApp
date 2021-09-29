import 'package:flutter/material.dart';
import 'package:movie/model/movie_model.dart';

class MovieDetail extends StatelessWidget {
  final Results movie;
  const MovieDetail({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        child: Text(movie.overview),
      ),
    );
  }
}
