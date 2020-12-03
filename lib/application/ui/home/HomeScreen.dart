import 'package:flutter/material.dart';
import 'components/MovieCategories.dart';
import 'components/MovieMainScreen.dart';

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
        body: SingleChildScrollView(
          child: MovieMainScreen()
        )
    );
  }
}