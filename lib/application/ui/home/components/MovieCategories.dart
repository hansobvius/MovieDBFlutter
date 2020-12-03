import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'MovieSection.dart';

class MovieCategories extends StatelessWidget{
  final MovieViewModel movieViewModel;
  MovieCategories({Key key, this.movieViewModel}): super(key: key);
  @override
  Widget build(BuildContext context){
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: movieViewModel.movieModel.length,
          itemBuilder: (BuildContext _context, int index){
            return MovieSection(movie: movieViewModel.movieModel[index]);
          }
      );
  }
}