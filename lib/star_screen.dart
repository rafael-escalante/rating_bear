import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter_rating/flutter_rating.dart';


class StarScreen extends StatefulWidget {
  const StarScreen({super.key});

  @override
  State<StarScreen> createState() => _MyWidgetState();

}


class _MyWidgetState extends State<StarScreen> {

  //variables de flutter_rating
  double rating = 0.0;
  int startCount = 5;

  //cerebro de la logica
  StateMachineController? controller;

  //state machine input
  SMITrigger? trigSuccess; //se emociona
  SMITrigger? trigFail; //se pone sad
  Artboard? _artboard;


  Future<void>_riveOnInit(bool? issucces)  async {
    
    _artboard!.removeController(controller!);
      
    controller = StateMachineController.fromArtboard(_artboard!, "Login Machine");

    if (controller != null) {
      _artboard!.addController(controller!);
      trigSuccess = controller!.findSMI<SMITrigger>('trigSuccess'); // Éxito
      trigFail = controller!.findSMI<SMITrigger>('trigFail'); // Fallo

    }

    

    await Future.delayed(const Duration(milliseconds: 50));

      if (issucces == null) return;
      if (issucces == true){
        trigSuccess?.fire();
      }
      else{
        trigFail?.fire();
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          
          children: [
            SizedBox(key: ValueKey(rating), height:200,
            child: RiveAnimation.asset("assets/animated_login_character.riv",

            onInit: (artboard){
              _artboard =artboard;
              controller = StateMachineController.fromArtboard(artboard, "Login Machine");
              if (controller != null){
                artboard.addController(controller!);
                trigSuccess = controller!.findSMI("trigSuccess");
                trigFail = controller!.findSMI("trigFail");
              }
            }, 
            //onInit: (artboard){
            //  controller = StateMachineController.fromArtboard(artboard, "Login Machine");
            //if(controller == null) return;
            //artboard.addController(controller!);

            //trigSuccess = controller!.findInput<bool>("trigSuccess") as SMITrigger?;
            //trigFail = controller!.findInput<bool>("trigFail") as SMITrigger?;

            //numLook = controller!.findInput<double>("numLook") as SMINumber?;
            //valor inicial de la mirada del oso
            //numLook?.value = 50.0;
            //}
            ),
            

            
            ),
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

                  onRatingChanged: (newRating) async {
                    setState(() {
                    rating = newRating;
                  });

                  if (controller !=null){
                    if (rating >3){
                      await _riveOnInit(true);
                    }
                    else if (rating <3){
                      await _riveOnInit(false);
                    }
                    else{
                      await _riveOnInit(null);
                    }
                  }

                 }),
              ],
            ),
            SizedBox(height: 35),
            SizedBox(width: double.infinity,
              child: TextButton(onPressed: (){}, style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
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

  @override
  void dispose() {
    // CRUCIAL: Liberar el controlador de Rive cuando el widget se destruye.
    controller?.dispose();
    super.dispose();
  }
}
