import 'package:flutter/material.dart';
import 'package:moviedb_flutter/application/business_logic/helpers/StringHelper.dart';
import 'package:moviedb_flutter/application/business_logic/view_model/MovieViewModel.dart';
import 'MovieSection.dart';

class MovieCategories extends StatelessWidget{
  final MovieViewModel movieViewModel;
  MovieCategories({Key key, this.movieViewModel}): super(key: key);
  @override
  Widget build(BuildContext context){
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: movieViewModel.movieModel.length,
          itemBuilder: (BuildContext _context, int index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    "${formatCategoryString(movieViewModel.categories[index])}",
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                MovieSection(movie: movieViewModel.movieModel[index]),
              ],
            );
          }
      );
  }
}