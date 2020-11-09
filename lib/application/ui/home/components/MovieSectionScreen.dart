import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:provider/provider.dart';
import 'MovieRowScreen.dart';

class MovieSectionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Consumer<MovieViewModel>(
      builder: (context, viewModel, child) => Stack(
        children: [
          FutureBuilder<MovieModel>(
            future: viewModel.getService(),
            builder: (BuildContext _context, snapshot){
              return snapshot.hasData
                ? MovieRowScreen(movie: snapshot.data)
                : Center(child: CircularProgressIndicator());
            },
          )
        ],
      )
    );
  }
}