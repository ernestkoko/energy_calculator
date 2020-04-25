import 'package:energycalculator/screens/SinglePhase.dart';
import 'package:energycalculator/screens/ThreePhase.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    )

  );
}

class HomeScreen extends StatelessWidget {
  String welcomeMessage = "Your are welcome!";
  String appBarName = "Energy Calculator";




  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Text(appBarName),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  welcomeMessage,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20.0),
              child: Text("Please select the number of phase(s) with any button below",
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.center,
              ),
            ),
            Row(children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  textColor: Colors.black,
                  child: Text("Single Phase (1)"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SinglePhase(),
                    ),);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: RaisedButton(
                  splashColor: Colors.deepPurple,
                  color: Colors.blueAccent,
                  textColor: Colors.black,
                  child: Text("Three Phase (3)"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder:(context) => ThreePhase(),

                    ));
                  },
                ),
              ),

            ],
            ),
          ],
        ),
      );
  }


}
