import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  final String title;
  final String posterPath;

  const ContentHeader({
    Key key,
    this.title,
    this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 600.0,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500/$posterPath'),
            fit: BoxFit.cover,
            alignment: new FractionalOffset.fromOffsetAndSize(
              new Offset(
                0.0,
                600.0,
              ),
              new Size(
                100.0,
                500.0,
              ),
            ),
          )),
        ),
        Container(
          height: 600.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent])),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 120.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Ação'),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    minRadius: 2,
                  ),
                  Text('Comédia'),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    minRadius: 2,
                  ),
                  Text('Aventura'),
                ],
              ),
            )),
        Positioned(
            left: 0,
            right: 0,
            bottom: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionButtonHeader(
                  icon: Icons.add,
                  label: 'Minha lista',
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 36,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Assistir',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
                OptionButtonHeader(
                  icon: Icons.info_outline_rounded,
                  label: 'Saiba mais',
                )
              ],
            ))
      ],
    );
  }
}

class OptionButtonHeader extends StatelessWidget {
  final IconData icon;
  final String label;

  const OptionButtonHeader({
    Key key,
    this.icon,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
