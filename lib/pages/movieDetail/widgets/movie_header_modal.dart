import 'package:api_project/core/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MovieInfoHeader extends StatelessWidget {
  final String posterPath;
  final String title;
  final String description;
  final DateTime releaseDate;

  const MovieInfoHeader({
    Key key,
    this.posterPath,
    this.title,
    this.description,
    this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.6;
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Container(
            height: 350,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500/$posterPath',
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: cWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  releaseDate.year.toString(),
                  style: TextStyle(color: Colors.white.withOpacity(0.4)),
                ),
                SizedBox(
                  height: 12,
                ),
                AutoSizeText(
                  description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
