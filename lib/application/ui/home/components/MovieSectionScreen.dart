import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:provider/provider.dart';
import 'MovieRow.dart';
import 'MovieRowScreen.dart';

class MovieSectionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Observer(
      builder: (context) {
      final viewModel = Provider.of<MovieViewModel>(context);
      return viewModel.movieModel.isNotEmpty
          ? MovieRowScreen(movie: viewModel.movieModel[0])
          : Center(child: CircularProgressIndicator());
      }
    );
  }
}