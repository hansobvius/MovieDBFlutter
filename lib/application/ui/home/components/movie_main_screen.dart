import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/movie_view_model.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/image_helper.dart';
import 'package:moviedb_flutter/application/ui/app_components/AppWidgets.dart';
import 'package:provider/provider.dart';
import 'movie_categories.dart';
import 'movie_favorites.dart';

class MovieMainScreen extends StatefulWidget{

  @override
  _MainMovieScreen createState() => _MainMovieScreen();
}

class _MainMovieScreen extends State<MovieMainScreen>{

  @override
  Widget build(BuildContext context){
    return Observer(
        builder: (context) {
          final viewModel = Provider.of<MovieViewModel>(context);
          if (viewModel.movieModel.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  movieHeader(getRandomImage(viewModel.movieModel)),
                  MovieCategories(movieViewModel: viewModel),
                  MovieFavorites()
                ],
              ),
            );
          } else {
            return Column(
                children: [
                  Expanded(child: Center(child: progressBar())),
                ],
              );
          }
        }
      );
  }
}

