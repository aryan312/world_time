import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
  
  
  String location; //location name for the ui
  String time;//time in that location

  String flag;//url to the asset flag icon
  String url;//location url for the api endpoint
  bool isDaytime;// for taking care of day n night true if day else otherwise

  WorldTime({this.location,this.flag,this.url});

  Future <void> getTime() async {


    try {
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
    Map data=jsonDecode(response.body);
    //print(data);

    //get properties from data
    String datetime=data['datetime'];
    String offset =data['utc_offset'].substring(1,3);
    String minoffset=data['utc_offset'].substring(4,6);
    //print(datetime);
    //print(offset);

    //create a date time object

    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offset)));
    now=now.add(Duration(minutes: int.parse(minoffset)));

     
     //set the time property
     isDaytime=now.hour>=6 && now.hour<=20? true:false;
    
    time=DateFormat.jm().format(now);
      
    }
     catch (e) {
       print('caught error - $e');
       time='could not get the time data';
    }
    
   


    
  }
  
  




}