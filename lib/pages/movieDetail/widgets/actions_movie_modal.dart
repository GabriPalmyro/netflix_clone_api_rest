import 'package:flutter/material.dart';

class ActionsMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
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
            icon: Icons.file_download,
            label: 'Baixar',
          ),
          OptionButtonHeader(
            icon: Icons.play_arrow_outlined,
            label: 'Prévia',
          )
        ],
      ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18,
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
