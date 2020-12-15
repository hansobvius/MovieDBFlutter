import 'package:flutter/material.dart';

Widget MovieDescription(String description){
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$description',
        style: TextStyle(
          fontSize: 16
        ),
      ),
    ),
  );
}