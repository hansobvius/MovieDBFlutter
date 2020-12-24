import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';

class TitleCard extends StatefulWidget{

  final MovieModelResults movie;
  final bool isFavorite;

  TitleCard({Key key, this.movie, this.isFavorite}) : super(key: key);

  @override
  _TitleCardState createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard>{

  bool favorite;
  MovieViewModel _store;

  @override
  void initState() {
    _store = ServiceLocator.provideMovieViewModel();
    favorite = widget.isFavorite;
    super.initState();
  }

  void setFavoriteAction(MovieModelResults moviesResults){
    _store.setMovieFavorite(moviesResults);
    setState(() {
      favorite = !favorite;
    });
  }

  void removeFavoriteAction(){

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.movie.title}',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            IconButton(
              icon: Icon(
                  favorite ? Icons.favorite : Icons.favorite_border,
                  color: favorite ? Colors.yellow : null
              ),
              onPressed: (){
                setFavoriteAction(widget.movie);
              },
            )
          ],
        ),
      ),
    );
  }
}