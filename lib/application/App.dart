import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'business_logic/view_model/MovieViewModel.dart';
import 'ui/home/HomeScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MovieViewModel>(
      create: (_){
        final viewModel = MovieViewModel()
            ..getMovieService();
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieDB Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}