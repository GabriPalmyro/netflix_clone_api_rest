import 'package:flutter/material.dart';

class FooterModal extends StatelessWidget {
  final Function onTap;

  const FooterModal({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: (screenSize.height * 0.4) * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenSize.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 28,
                  ),
                  Text('Mais informações',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Icon(
              Icons.arrow_right,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
