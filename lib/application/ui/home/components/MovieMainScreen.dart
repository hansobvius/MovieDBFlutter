import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';
import 'package:moviedb_flutter/application/ui/appcomponents/AppWidgets.dart';
import 'package:provider/provider.dart';
import 'MovieCategories.dart';

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
          return viewModel.movieModel.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                      children: [
                        MovieHeader(getRandomImage(viewModel.movieModel)),
                        MovieCategories(movieViewModel: viewModel)
                      ],
                  ),
              )
              : Column(
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
        }
      );
  }
}

