import 'package:http/http.dart';
import 'dart:convert'; //Convert json data
import 'package:intl/intl.dart';

class WorldTime{

  String location; //Location name for the UI
  String time; //Time in that location
  String flag; //Country flag icon
  String url; //Location url for API end points
  bool isDayTime; //True if it is day, false if it is night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime()async{
    try {
      // Make request
      Response response = await get(
          "https://worldtimeapi.org/api/timezone/$url"); //Asia/Gaza
      Map data = jsonDecode(response.body); //Convert data
      // Get properties from data
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      //Create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //Set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch(e) {
      print("caught error: $e");
      time = "Couldn't get time data";
    }
  }
}