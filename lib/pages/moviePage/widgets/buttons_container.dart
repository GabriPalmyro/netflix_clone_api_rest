import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDark;

  const ButtonContainer({Key key, this.icon, this.label, this.isDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isDark ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isDark ? Colors.black : Colors.white,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            label,
            style: TextStyle(color: isDark ? Colors.black : Colors.white),
          )
        ],
      ),
    );
  }
}
