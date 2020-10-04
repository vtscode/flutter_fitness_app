import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_ui/screen/exercisehub.dart';
import 'dart:async';

class ExerciseScreen extends StatefulWidget {

  final Exercises exercises;
  final int seconds;
  ExerciseScreen({this.exercises,this.seconds});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {

  bool _isCompleted = false;
  int _elapsedSeconds = 0;

  Timer timer;

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if(timer.tick == widget.seconds){
          timer.cancel();
          setState(() {
            _isCompleted = true;
          });
          playAudio();
        }
        setState(() {
          _elapsedSeconds = timer.tick;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  void playAudio(){
    audioCache.play("congrats.wav");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.exercises.gif,
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
          ),

          _isCompleted != true ? SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              child: Text("$_elapsedSeconds/${widget.seconds} S"),
            ),
          ) : Container(),

          SafeArea(
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          )
        ]
      ),
    );
  }
}
