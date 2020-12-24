import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/ui/appcomponents/AppWidgets.dart';
import 'components/MovieDescription.dart';
import 'components/TItleCard.dart';

class MovieDetailScreen extends StatelessWidget{

  final MovieModelResults movieResults;

  MovieDetailScreen({this.movieResults});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('TheMovieDB'), centerTitle: true, backgroundColor: Colors.black,),
      body: Column(
        children: [
          MovieHeader(movieResults.backdrop_path),
          TitleCard(movie: movieResults, isFavorite: false),
          MovieDescription(movieResults.overview)
        ],
      )
    );
  }
}