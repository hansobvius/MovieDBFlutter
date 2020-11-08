import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:provider/provider.dart';
import 'MovieRowScreen.dart';

class MovieSectionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Consumer<MovieViewModel>(
      builder: (context, viewModel, child) => Stack(
        children: [
          ListView.builder(
            itemBuilder: (BuildContext _context, int index){
              viewModel.getMovieService();
              return MovieRowScreen();
            },
          )
        ],
      )
    );
  }
}