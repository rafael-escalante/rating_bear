import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter_rating/flutter_rating.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
                child: RiveAnimation.asset("animated_login_character.riv")),
            Text(
              "Enjoying Sounter?",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              "With how many stars do",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(height: 10),
            Text(
              "you rate your experience.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(height: 10),
            Text(
              "Tap a star to rate",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
