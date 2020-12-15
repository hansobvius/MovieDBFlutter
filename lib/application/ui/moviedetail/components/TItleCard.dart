import 'package:flutter/material.dart';

Widget TitleCard(String title){
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}