import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:provider/provider.dart';
import 'MovieSection.dart';

class MovieCategories extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Observer(
      builder: (context) {
      final viewModel = Provider.of<MovieViewModel>(context);
      return viewModel.movieModel.isNotEmpty
          ? ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: viewModel.movieModel.length,
            itemBuilder: (BuildContext _context, int index){
              return MovieSection(movie: viewModel.movieModel[index]);
            }
          )
          : Center(child: CircularProgressIndicator());
      }
    );
  }
}