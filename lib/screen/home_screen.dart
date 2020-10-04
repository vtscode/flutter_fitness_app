import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_ui/screen/exercise_start_screen.dart';
import 'package:flutter_fitness_ui/screen/exercisehub.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homepage extends StatefulWidget {

  Homepage({Key key})  : super(key : key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final String apiURL = 'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';
  ExerciseHub exerciseHub; // variable to save data from API

  @override
  void initState() {
    // TODO: implement initState
    getExercise();
    super.initState();
  }

  void getExercise() async{
    var response = await http.get(apiURL);
    var body = response.body;
    var decodedJSON = jsonDecode(body);
    exerciseHub = ExerciseHub.fromJson(decodedJSON);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fitness Workout'
        ),
      ),
      body: Container(
        child: exerciseHub != null ? ListView(
          children: exerciseHub.exercises.map((e) {
            return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExerciseStartScreen(
                    exercises: e,
                  ) )
                );
              },
              child: Hero(
                tag: e.id,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0)
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        // child: FadeInImage(
                        //   image: NetworkImage(e.thumbnail),
                        //   placeholder: AssetImage("assets/logo.png"),
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 250,
                        //   fit: BoxFit.cover,
                        // ),
                        child: CachedNetworkImage(
                          imageUrl: e.thumbnail,
                          placeholder: (context,url) => Image(
                            image: AssetImage('assets/logo.png'),
                            fit: BoxFit.cover,
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                          ),
                          errorWidget: (context,url,error) =>
                          Icon(Icons.error),
                          fit: BoxFit.cover,
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff000000),
                                Color(0x00000000)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.center
                            )
                          ),
                        ),
                      ),

                      Container(
                        height: 250.0,
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(left: 10.0,bottom : 10.0),
                        child: Text(
                          e.title,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )

                    ],
                  )
                ),
              ),
            );
          }).toList(),
        ): LinearProgressIndicator(),
      ),
    );
  }
}
