import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';

class MovieSection extends StatelessWidget{

  MovieModel movie;

  MovieSection({ this.movie });

  @override
  Widget build(BuildContext context){
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.movie.results.length,
        itemBuilder: (BuildContext _context, int index){
          return Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Wrap(
                children: [
                  Image(
                    image: NetworkImage(getImage(this.movie.results[index].poster_path)),
                  )
                ]
            )
          );
        }
      ),
    );
  }
}