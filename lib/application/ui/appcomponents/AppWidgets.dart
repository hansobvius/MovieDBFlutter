import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';

Widget ToolBar(){
  return AppBar(title: Text('TheMovieDB'), centerTitle: false, backgroundColor: Colors.black);
}

Widget MovieHeader(String posterPath){
  return   Container(
    child: Image(
      image: NetworkImage(getImage(posterPath)),
    ),
  );
}