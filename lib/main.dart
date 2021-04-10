import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/choose_locations.dart';
import 'package:world_time_app/Pages/home.dart';
import 'package:world_time_app/Pages/loading.dart';
void main() {
  runApp(MaterialApp(
    //Create routing system for different screens
    initialRoute: "/", //Set up first page that is going to load up at the start of the app
    routes: {
      "/":(context) => Loading(), //Context keeps track of where in the routing tree you are
      "/home":(context) => Home(),
      "/location":(context) => ChooseLocations(),
    },
  ));
}
