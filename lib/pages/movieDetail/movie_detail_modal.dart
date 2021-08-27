import 'package:api_project/pages/moviePage/page/movie_page.dart';
import 'package:flutter/material.dart';
import 'package:api_project/models/movie_model.dart';

import 'widgets/actions_movie_modal.dart';
import 'widgets/footer_modal.dart';
import 'widgets/movie_header_modal.dart';

class MovieDetailModal extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailModal({
    Key key,
    this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2a2a2a),
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0)),
        ),
        height: screenSize.height * 0.45,
        child: Column(
          children: [
            Container(
                height: (screenSize.height * 0.45) * 0.75,
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: MovieInfoHeader(
                          posterPath: movie.posterPath,
                          title: movie.title,
                          description: movie.overview,
                          releaseDate: movie.releaseDate,
                        )),
                    Expanded(flex: 1, child: ActionsMovie())
                  ],
                )),
            Divider(),
            FooterModal(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MovieDetailPage(
                            movie: movie,
                          ))),
            )
          ],
        ),
      ),
    );
  }
}
