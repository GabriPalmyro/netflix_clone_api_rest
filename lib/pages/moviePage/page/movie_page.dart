import 'package:api_project/models/movie_model.dart';
import 'package:api_project/pages/moviePage/styles/styles.dart';
import 'package:api_project/pages/moviePage/widgets/action_button.dart';
import 'package:api_project/pages/moviePage/widgets/buttons_container.dart';
import 'package:api_project/pages/moviePage/widgets/previewBar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel movie;

  const MovieDetailPage({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.cast),
          SizedBox(
            width: 24,
          ),
          Icon(Icons.search),
          SizedBox(
            width: 24,
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${widget.movie.backdropPath}',
                ),
                fit: BoxFit.cover,
              )),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                      right: 5,
                      bottom: 15,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text('Trailer'),
                      )),
                  PreviewBar(),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(color: Colors.red[800]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.movie.title,
                style: Styles.titleStyle,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (widget.movie.voteAverage * 10).toStringAsFixed(0) +
                        '% relevante',
                    style: Styles.relevantText,
                  ),
                  Text(
                    widget.movie.releaseDate.year.toString(),
                    style: Styles.releaseDateText,
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  ButtonContainer(
                    icon: Icons.play_arrow_sharp,
                    label: 'Assistir',
                    isDark: true,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ButtonContainer(
                    icon: Icons.download_sharp,
                    label: 'Fazer download',
                    isDark: false,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 40),
                    child: AutoSizeText(
                      widget.movie.overview,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.releaseDateText,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionButton(
                        icon: Icons.add,
                        label: 'Minha lista',
                      ),
                      ActionButton(
                        icon: Icons.thumb_up_alt_outlined,
                        label: 'Classifique',
                      ),
                      ActionButton(
                        icon: Icons.share_sharp,
                        label: 'Compartilhe',
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
