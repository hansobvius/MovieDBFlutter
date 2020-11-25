import 'package:flutter/material.dart';
import 'components/MovieCategories.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'TheMovieDB'
          ),
          centerTitle: true,
        ),
        body: Center(
          child: MovieCategories()
        )
    );
  }
}