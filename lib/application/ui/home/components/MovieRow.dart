import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';

import 'MovieRowScreen.dart';

class MovieRow extends StatelessWidget{

  final List<Future<MovieModel>> movieModelList;
  List<MovieModel> movies;

  MovieRow({Key key,  List<Future<MovieModel>> this.movieModelList}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView.builder(
        itemBuilder: (BuildContext context, int index){
          movieModelList.forEach((element) {
            element.then((value) => movies.add(value));
          });
          return MovieRowScreen(movie: this.movies[index]);
        }
    );
  }
}