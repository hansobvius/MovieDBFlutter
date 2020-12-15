import 'dart:convert';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:http/http.dart' as http;

class ServiceApi{

  Future<MovieModel> serviceApi(String value) async {

    const TOKEN = '38eeef9aa65a725363ccb5cde9df6342';
    const BASE_URL = 'https://api.themoviedb.org/3/movie/';
    const DEFAULT_LANGUAGE = 'en-US';
    const DEFAULT_PAGE = 1;

    final http.Client client = http.Client();

    final response = await client.get("${BASE_URL}${value}?api_key=${TOKEN}&language=${DEFAULT_LANGUAGE}&page=${DEFAULT_PAGE}");

    if(response.statusCode == 200){
      print("Result: ${response.body}");
      return parseModel(response.body);
    }else {
      throw Exception('Failed HTTP Request');
    }
  }

  MovieModel parseModel(String responseBody){
    Map obj = jsonDecode(responseBody);
    var movies = MovieModel.fromJson(obj);
    return movies;
  }
}

