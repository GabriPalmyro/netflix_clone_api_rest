import 'package:api_project/models/movie_model.dart';
import 'package:api_project/pages/movieDetail/movie_detail_modal.dart';
import 'package:flutter/material.dart';

import 'movie_card.dart';

class ContentList extends StatelessWidget {
  final String label;
  final List<MovieModel> contentList;

  const ContentList({
    Key key,
    this.label,
    this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 180.0,
          child: ListView.builder(
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return MovieCard(
                  onTap: () => showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) =>
                          MovieDetailModal(movie: contentList[index])),
                  posterPath: contentList[index].posterPath,
                  title: contentList[index].title,
                );
              }),
        )
      ],
    );
  }
}
