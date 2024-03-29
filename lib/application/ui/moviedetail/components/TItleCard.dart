import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviedb_flutter/application/business_logic/model/movie/MovieModelResults.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'package:moviedb_flutter/application/di/ServiceLocator.dart';

class TitleCard extends StatefulWidget{

  final MovieModelResults movie;
  TitleCard({Key? key, required this.movie}) : super(key: key);

  @override
  _TitleCardState createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard>{

  late MovieViewModel _store;

  @override
  void initState() {
    _store = ServiceLocator.instance.movieViewModel..
      checkFavoriteMovie(widget.movie.id!);
    super.initState();
  }

  void setFavoriteAction(MovieModelResults moviesResults){
    _store.setMovieFavorite(moviesResults);
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
            Observer(
              builder: (context){
                return IconButton(
                  icon: Icon(
                      (_store.isSaved != null && _store.isSaved!)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: (_store.isSaved != null && _store.isSaved!)
                          ? Colors.yellow
                          : null
                  ),
                  onPressed: (){
                    setFavoriteAction(widget.movie);
                  },
                );
              }
            )
          ],
        ),
      ),
    );
  }
}