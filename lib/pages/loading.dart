import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  
  
  


  void setupWorldTime() async {
    WorldTime instance= WorldTime(flag: 'Berlin.png' ,location:'Berlin',url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'time':instance.time,
      'location':instance.location,
      'flag':instance.flag,
      'isDaytime':instance.isDaytime,
    });
    
    
  }

  @override
  void initState() {
    
    super.initState();
    setupWorldTime();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child:  SpinKitFadingCube(
        color: Colors.amber,
         size: 50.0,
      ),

      )
    );
  }
}