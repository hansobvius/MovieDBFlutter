import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';

PreferredSizeWidget CustomAppBar(){
  return AppBar(title: Text('TheMovieDB'), centerTitle: false, backgroundColor: Colors.black);
}

Widget MovieHeader(String posterPath){
  return   Container(
    child: Image(
      image: NetworkImage(getImage(posterPath)),
    ),
  );
}

Widget ProgressBar(){
  return CircularProgressIndicator(
    backgroundColor: Colors.black,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    strokeWidth: 3,
  );
}