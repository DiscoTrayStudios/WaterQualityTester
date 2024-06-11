import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xff1889e6),
          child: Text(
            number,
            style: const TextStyle(
                fontFamily: "Comfortaa",
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(text,
            style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontFamily: "Sans")));
  }
}
