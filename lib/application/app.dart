import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/di/service_locator.dart';
import 'package:provider/provider.dart';
import 'business_logic/view_model/movie_view_model.dart';
import 'ui/home/home_screen.dart';

class App extends StatelessWidget {
  final movieViewModel = ServiceLocator.instance.movieViewModel;
  @override
  Widget build(BuildContext context) {
    return Provider<MovieViewModel>(
      create: (_){
        return movieViewModel
          ..getMovieService()
          ..getFavoriteMovies();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieDB Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen()
      ),
    );
  }
}