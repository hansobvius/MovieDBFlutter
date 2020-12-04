import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';
import 'package:provider/provider.dart';
import 'business_logic/view_model/MovieViewModel.dart';
import 'ui/home/HomeScreen.dart';

class App extends StatelessWidget {
  final movieViewModel = ServiceLocator.provideMovieViewModel();
  @override
  Widget build(BuildContext context) {
    return Provider<MovieViewModel>(
      create: (_){
        return movieViewModel..getMovieService();
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