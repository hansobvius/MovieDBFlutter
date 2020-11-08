import 'package:flutter/material.dart';
import 'components/MovieSectionScreen.dart';

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
          child: MovieSectionScreen()
        )
    );
  }
}