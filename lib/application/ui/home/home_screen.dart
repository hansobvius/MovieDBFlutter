import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/ui/app_components/AppWidgets.dart';
import 'components/movie_main_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: customAppBar(),
        body: MovieMainScreen()
    );
  }
}
