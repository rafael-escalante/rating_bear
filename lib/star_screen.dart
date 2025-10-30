import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:rating_bar_custom/rating_bar_custom.dart';

class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() => _MyWidgetState();

}


class _MyWidgetState extends State<StarScreen> {

  double rating = 3.5;
  int startCount = 5;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          
          children: [
            SizedBox(height:200,
            child: RiveAnimation.asset("assets/animated_login_character.riv")),
            SizedBox(height: 15),
            Text(
              "Enjoying Sounter?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.w700
              ),
              ),
            SizedBox(height: 20),
            Text(
              "With how many stars do",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 0),
            Text(
              "you rate your experience",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 0),
            Text(
              "Tap a star to rate!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 27,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarRating(
                  size: 67.0,
                  rating: rating,
                  starCount: startCount,
                  color: Colors.amberAccent,
                  allowHalfRating: true,

                  onRatingChanged: (newRating) => setState(() {
                    this.rating = newRating;
                  }),
                ),
              ],
            ),
            SizedBox(height: 35),
            SizedBox(width: double.infinity,
              child: TextButton(onPressed: (){}, style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10)
                )
              ), child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text("Rate now", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
              )),
            ),
            SizedBox(height: 30),
            SizedBox(width: double.infinity,
              child: TextButton(onPressed: (){}, 
                child: Text("NO THANKS", style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),),
              )),
            
            
  
          ],
        ),
      )),
    );
  }
}
