import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';

class MovieHeader extends StatelessWidget{

  final String posterPath;

  MovieHeader({Key key, this.posterPath}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Image(
        image: NetworkImage(getImage(posterPath)),
      ),
    );
  }
}