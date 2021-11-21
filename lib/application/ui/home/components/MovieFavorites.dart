import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/ImageHelper.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';
import 'package:moviedb_flutter/application/ui/moviedetail/MovieDetailScreen.dart';
import 'package:provider/provider.dart';

class MovieFavorites extends StatefulWidget{

  @override
  _MovieFavorites createState() => _MovieFavorites();
}

class _MovieFavorites extends State<MovieFavorites>{

  late MovieViewModel _store;

  @override
  void initState(){
    _store = ServiceLocator.instance.movieViewModel
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
        var favoriteStore = Provider.of<MovieViewModel>(context);
        return Offstage(
          offstage: favoriteStore.favoriteMovies!.isNotEmpty ? false : true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(favoriteStore.favoriteMovies!.isNotEmpty) Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  "favorites",
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
              ),
              Container(
                height: favoriteStore.favoriteMovies!.isNotEmpty ? 200 : 0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _store.favoriteMovies!.length ?? 0,
                  itemBuilder: (BuildContext _context, int index) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      width: 150,
                      child: Wrap(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigate(context, _store.favoriteMovies![index]);
                            },
                            child: Image(
                              image: NetworkImage(getImage(
                                  favoriteStore.favoriteMovies![index].poster_path!)),
                            ),
                          )
                        ]
                      )
                    );
                  }
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}