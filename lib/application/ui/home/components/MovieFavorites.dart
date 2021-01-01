import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';
import 'package:moviedb_flutter/application/ui/moviedetail/MovieDetailScreen.dart';

class MovieFavorites extends StatefulWidget{

  @override
  _MovieFavorites createState() => _MovieFavorites();
}

class _MovieFavorites extends State<MovieFavorites>{

  MovieViewModel _store;

  @override
  void initState(){
    _store = ServiceLocator.provideMovieViewModel()
        ..getFavoriteMovies();
    super.initState();
  }

  void navigate(BuildContext context, MovieModelResults movie){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            MovieDetailScreen(movieResults: movie))
    );
  }

  @override
  Widget build(BuildContext _context) {
    return Observer(
        builder: (_context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(_store.favoriteMovies.isNotEmpty) Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "favorites",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              Container(
                height: _store.favoriteMovies.length != 0 ? 200 : 0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _store.favoriteMovies.length ?? 0,
                    itemBuilder: (BuildContext _context, int index) {
                      return Container(
                          padding: EdgeInsets.all(8.0),
                          width: 150,
                          child: Wrap(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    navigate(context, _store.favoriteMovies[index]);
                                  },
                                  child: Image(
                                    image: NetworkImage(getImage(
                                        _store.favoriteMovies[index].poster_path)),
                                  ),
                                )
                              ]
                          )
                      );
                    }
                ),
              ),
            ],
          );
        }
    );
  }
}