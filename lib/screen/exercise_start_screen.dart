import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_ui/screen/exercise_screen.dart';
import 'package:flutter_fitness_ui/screen/exercisehub.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {

  final Exercises exercises;

  ExerciseStartScreen({this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {

  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: widget.exercises.id,
        // child: Image(
        //   image: NetworkImage(widget.exercises.thumbnail),
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        //   fit: BoxFit.cover,
        // ),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.exercises.thumbnail,
              placeholder: (context,url) => Image(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              errorWidget: (context,url,error)=> Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff000000),
                    Color(0x00000000),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center
                )
              ),
            ),
            Positioned(
              bottom: 40.0,
              left: 0,
              right: 0,
              child: Container(
                width: 200,
                height: 200,
                child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(),
                    onChange: (double value) {
                      seconds = value.toInt();
                    },
                  initialValue: 30,
                  min: 10,
                  max: 60,
                  innerWidget: (v) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${v.toInt()} S",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      );
                  },
                ),
              ),
            ),

            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseScreen(
                      exercises:widget.exercises,
                      seconds: seconds,
                    )));
                },
                color: Color(0xffe83350),
                child: Text('Start Exercise',
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                splashColor: Colors.black,
              ),
            )
          ]
        ),
      ),
    );
  }
}
