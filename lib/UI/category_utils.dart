import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Icon categoryIcon(String category) {
  if (category == 'Arts & Literature') {
    return const Icon(Icons.draw_outlined, color: Colors.white);
  } else if (category == 'Film & TV') {
    return const Icon(Icons.movie_creation, color: Colors.white);
  } else if (category == 'Food & Drink') {
    return const Icon(Icons.fastfood, color: Colors.white);
  } else if (category == 'General Knowledge') {
    return const Icon(Icons.book, color: Colors.white);
  } else if (category == 'Geography') {
    return const Icon(CupertinoIcons.globe, color: Colors.white);
  } else if (category == 'History') {
    return const Icon(Icons.punch_clock, color: Colors.white);
  } else if (category == 'Music') {
    return const Icon(Icons.music_note, color: Colors.white);
  } else if (category == 'Science') {
    return const Icon(Icons.science, color: Colors.white);
  } else if (category == 'Society & Culture') {
    return const Icon(CupertinoIcons.group_solid, color: Colors.white);
  } else {
    return const Icon(Icons.sports_handball_rounded, color: Colors.white);
  }
}

Color? categoryColors(String category) {
  if (category == 'Arts & Literature') {
    return Colors.blue[400];
  } else if (category == 'Film & TV') {
    return Colors.green[400];
  } else if (category == 'Food & Drink') {
    return Colors.purple[400];
  } else if (category == 'General Knowledge') {
    return Colors.yellow[700];
  } else if (category == 'Geography') {
    return Colors.red[400];
  } else if (category == 'History') {
    return Colors.cyan[400];
  } else if (category == 'Music') {
    return Colors.pink[300];
  } else if (category == 'Science') {
    return Colors.indigo[400];
  } else if (category == 'Society & Culture') {
    return Colors.greenAccent[400];
  } else {
    return Colors.blue[800];
  }
}
