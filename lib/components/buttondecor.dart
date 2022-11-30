import 'package:flutter/material.dart';

class ButtonDecor extends StatelessWidget {
  ButtonDecor({
    Key? key,
    required this.title,
    required this.colour,
    required this.onPressed,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Color colour;
  final double height;
  final double width;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: onPressed,
          height: height,
          minWidth: width,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Oswald',
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
