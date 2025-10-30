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
  double rating = 3.5;
  int startCount = 5;

  //cerebro de la logica
  StateMachineController? controller;

  //state machine input
  SMITrigger? trigSuccess; //se emociona
  SMITrigger? trigFail; //se pone sad
  SMINumber? numLook; //0..80 en tu asset (mirada neutral)

  void _riveOnInit(Artboard artboard){
    controller = StateMachineController.fromArtboard(artboard, "Login Machine");

    if(controller == null){
      debugPrint("Rive error: State Machine 'Login Machine' no encontrada");
      return;
    }

    artboard.addController(controller!);

    trigSuccess = controller!.findInput<bool>("trigSuccess") as SMITrigger?;
    trigFail = controller!.findInput<bool>("trigFail") as SMITrigger?;
    numLook = controller!.findInput<double>("numLook") as SMINumber?;

    numLook?.value = 50;

  Future.delayed(const Duration(milliseconds: 50), (){
    if (rating <=2.5){
      trigFail?.fire();
    }
    else if (rating >= 4){
      trigSuccess?.fire();
    }

  });}

  // @override
  //void initState() {
  //  super.initState();
    // Puedes inicializar valores o cargar datos aquí.
  //}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          
          children: [
            SizedBox(key: ValueKey(rating), height:200,
            child: RiveAnimation.asset("assets/animated_login_character.riv", stateMachines: const ["Login Machine"],
            onInit: _riveOnInit,
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

                  onRatingChanged: (newRating) => setState(() {
                    this.rating = newRating;

                    //Solucion para interrupciones de animación (Reset del state machine)
                    //limpiar el controlador actual
                    controller?.dispose();
                    controller = null;

                    //Logica de RIVE (animación)

                    //calificacion baja
                    //if (newRating <=2.5){
                    //  trigFail?.fire();
                    //}
                    //calificación alta
                    //else if (newRating >=4.0){
                    //  trigSuccess?.fire();
                    //}
                    //calificaión neutral
                    //else {

                    //}
                    //numLook?.value = 50.0;



                  }),
                ),
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
