import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/ui/appcomponents/AppWidgets.dart';
import 'components/MovieCategories.dart';
import 'components/MovieMainScreen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: ToolBar(),
        body: MovieMainScreen()
    );
  }
}
