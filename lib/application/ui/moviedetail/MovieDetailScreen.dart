import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/ui/home/components/MovieHeader.dart';
import 'package:provider/provider.dart';

import 'components/MovieDescription.dart';
import 'components/TItleCard.dart';

class MovieDetailScreen extends StatelessWidget{

  final MovieModelResults movieResults;

  MovieDetailScreen({this.movieResults});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('TheMovieDB'), centerTitle: true),
      body: Column(
        children: [
          MovieHeader(movieResults.backdrop_path),
          TitleCard(movieResults.title),
          MovieDescription(movieResults.overview)
        ],
      )
    );
  }
}