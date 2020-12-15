import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModel.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/ui/moviedetail/MovieDetailScreen.dart';

class MovieSection extends StatelessWidget{

  MovieModel movie;

  MovieSection({ this.movie });
  
  void navigate(BuildContext context, MovieModelResults movie){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MovieDetailScreen(movieResults: movie)));
  }

  @override
  Widget build(BuildContext context){
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.movie.results.length,
        itemBuilder: (BuildContext _context, int index){
          return Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Wrap(
                children: [
                  GestureDetector(
                    onTap: (){
                      navigate(context, this.movie.results[index]);
                    },
                    child: Image(
                      image: NetworkImage(getImage(this.movie.results[index].poster_path)),
                    ),
                  )
                ]
            )
          );
        }
      ),
    );
  }
}