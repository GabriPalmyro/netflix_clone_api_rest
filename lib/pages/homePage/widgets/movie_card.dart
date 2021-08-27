import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final String title;
  final Function onTap;

  const MovieCard({
    Key key,
    this.posterPath,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 120,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/$posterPath'),
                  fit: BoxFit.cover)),
        ));
  }
}
