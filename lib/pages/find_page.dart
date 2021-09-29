import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/movie_model.dart';
import 'package:movie/provider/api_provider.dart';

class FindListPage extends StatefulWidget {
  @override
  FindListPageState createState() => FindListPageState();
}

class FindListPageState extends State<FindListPage> {
  List<MovieModel> movies = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final movies = await ApiProvider.getMovies(query);

    setState(() => this.movies = movies);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return buildBook(movie);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        final movies = await ApiProvider.getMovies(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.movies = movies;
        });
      });

  Widget buildBook(MovieModel movie) => ListTile(
        leading: CachedNetworkImage(
          movie.poster,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        title: Text(movie.title),
        subtitle: Text(movie.author),
      );
}
