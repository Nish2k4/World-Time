import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments; //Return a map of data (list of arguments) from loading
    print(data);

    //Change background depending on the day time
    String bgImage = data["isDayTime"] ? "day.png" : "night.jpeg";
    Color bgColor = data["isDayTime"] ? Colors.blue[200] : Colors.black; //Change background depending on the time of day
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: ()async{ //async tells function to wait until other actions are done
                      dynamic result = await Navigator.pushNamed(context, "/location"); //Navigate to a different page on the app
                      setState(() {
                        data = {
                          "time":result["time"],
                          "location":result["location"],
                          "isDayTime":result["isDayTime"],
                          "flag":result["result"],
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.white,
                    ),
                    label: Text(
                        "Edit location",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ // Use children for multiple widgets or for widget with multiple styles
                    Text(
                      data["location"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data["time"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
