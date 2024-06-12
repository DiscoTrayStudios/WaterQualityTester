import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  final String text;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
        //height: 100.0,
        //width: 18.0,
        children: [
          Ink(
            decoration: const ShapeDecoration(
              color: Color(0xffB6D6CC),
              shape: CircleBorder(),
            ),
            child: IconButton(
                padding: const EdgeInsets.all(10),
                color: Colors.black,
                icon: Icon(icon),
                iconSize: 60,
                onPressed: onPressed),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: "Comfortaa"),
          ),
          const SizedBox(
            height: 20,
          ),
        ]);
  }
}

class WaterTextButton extends StatelessWidget {
  const WaterTextButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Comfortaa',
          ),
        ),
      ),
    );
  }
}
