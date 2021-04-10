import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: "Gaza", flag: "palestine.png", url: "Asia/Gaza");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: { //Replace loading page with home page
      //Pass 3 properties and allow home screen to access data from the loading page
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime,
    });
  }
  @override
  void initState(){
    super.initState(); //Super declares init state to run before anything else
    setUpWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.amber,
          size: 60,
        ),
      ),
    );
  }
}
