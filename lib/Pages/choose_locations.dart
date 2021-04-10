import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import '';
class ChooseLocations extends StatefulWidget {
  @override
  _ChooseLocationsState createState() => _ChooseLocationsState();
}

class _ChooseLocationsState extends State<ChooseLocations> {
  // Add locations
  List<WorldTime> locations = [
    WorldTime(url: "America/Dallas", location: "Dallas", flag: "usa.png"),
    WorldTime(url: "America/LosAngeles", location: "Los Angeles", flag: "usa.png"),
    WorldTime(url: "Asia/Dubai", location: "Dubai", flag: "uae.jpg"),
    WorldTime(url: "Australia/Perth", location: "Perth", flag: "australia.png"),
    WorldTime(url: "Russia/Moscow", location: "Moscow", flag: "russia.png"),
    WorldTime(url: "Japan/Tokyo", location: "Tokyo", flag: "japan.jpg"),
    WorldTime(url: "Switzerland/Geneva", location: "Geneva", flag: "switzerland.png"),
    WorldTime(url: "India/Baroda", location: "Baroda", flag: "india.jpg"),
  ];

  //Update time properties once location is changed
  void updateTime(index)async{
    WorldTime instance = locations[index]; // Store index of new location
    await instance.getTime(); // Wait until we get time for the new location
    // Navigate to home screen and pass the data
    Navigator.pop(context, { // Close navigation page and pass the data
      "location":instance.location,
      "time":instance.time,
      "flag":instance.flag,
      "isDayTime":instance.isDayTime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar( // When you use an app bar on different page in app it creates a back arrow by default
        backgroundColor: Colors.cyan,
        title: Text ("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder( // Show locations as a list on the screen
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location), // Show location name on screen
                leading: CircleAvatar( // Show the flag next to the name
                  backgroundImage: AssetImage("images/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
