import 'package:flutter/material.dart';

class TitleCard extends StatefulWidget{

  final String title;
  final bool isFavorite;

  TitleCard({Key key, this.title, this.isFavorite}) : super(key: key);

  @override
  _TitleCardState createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard>{

  bool favorite;

  @override
  void initState() {
    favorite = widget.isFavorite;
    super.initState();
  }

  void favoriteAction(){
    setState(() {
      favorite = !favorite;
    });
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
              '${widget.title}',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
            IconButton(
              icon: Icon(
                  favorite ? Icons.favorite : Icons.favorite_border,
                  color: favorite ? Colors.red : null
              ),
              onPressed: (){
                favoriteAction();
              },
            )
          ],
        ),
      ),
    );
  }
}