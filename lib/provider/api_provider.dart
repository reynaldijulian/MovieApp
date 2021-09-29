import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:movie/model/movie_model.dart';

class ApiProvider {
  String apiKey = '8a48624b7185710c0fb3d5c2da129b04';
  String baseUrl = 'https://api.themoviedb.org/3';
  Client client = Client();

  Future<MovieModel> getNowPlaying() async {
    //  String url = '$baseUrl/movie/now_playing?api_key=$apiKey';
    //  print(url);
    Response response =
        await client.get('$baseUrl/movie/now_playing?api_key=$apiKey');

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<MovieModel> getTopRated() async {
    //  String url = '$baseUrl/movie/top_rated?api_key=$apiKey';
    //  print(url);
    Response response =
        await client.get('$baseUrl/movie/top_rated?api_key=$apiKey');

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<MovieModel> getUpcoming() async {
    //  String url = '$baseUrl/movie/upcoming?api_key=$apiKey';
    //  print(url);
    Response response =
        await client.get('$baseUrl/movie/upcoming?api_key=$apiKey');

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<MovieModel> getPopular() async {
    //  String url = '$baseUrl/movie/popular?api_key=$apiKey';
    //  print(url);
    Response response =
        await client.get('$baseUrl/movie/popular?api_key=$apiKey');

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
