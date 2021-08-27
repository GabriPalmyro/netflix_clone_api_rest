import 'package:flutter/material.dart';

class PreviewBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.red.withOpacity(0.2)),
      ),
    );
  }
}
