import 'package:flutter/material.dart';

class Home extends StatelessWidget{
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
          child: Text(
            'The MovieDB Application'
          ),
        )
    );
  }
}