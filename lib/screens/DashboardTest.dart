import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Mariem/AndroidStudioProjects/sh_project/lib/screens/SimpleCircle.dart';
import 'CircleProgress.dart';
import 'SlideServo.dart';

class DashboardTest extends StatefulWidget {
  @override
  _DashboardTestState createState() => _DashboardTestState();
}
//for commit

class _DashboardTestState extends State<DashboardTest>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  final databaseReference = FirebaseDatabase.instance.reference();

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;

  @override
  void initState() {
    super.initState();

    databaseReference
        .child('ESP32_Device')
        .once()
        .then((DataSnapshot snapshot) {
      double temp = snapshot.value['Tempurature']['Data'];
      double humidity = snapshot.value['humidity']['Data'];

      isLoading = true;
      _DashboardInit(temp, humidity);
    });
  }

  _DashboardInit(double temp, double humid) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation =
    Tween<double>(begin: -50, end: temp).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    humidityAnimation =
    Tween<double>(begin: 0, end: humid).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: Text('Smart House'),
          centerTitle: true,
          automaticallyImplyLeading: false
      ),
      body: Center(
          child: isLoading
              ? Column(
            children: <Widget>[
              //gas and flame Row
              Row(
                children: <Widget>[
                  Container(
                    width: 410,
                    height: 100,
                    decoration: new BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ],
              ),
              //Temp and hum Row
              Text(
                'Temp and hum',
                style: TextStyle(
                    fontSize: 25 , fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomPaint(
                    foregroundPainter:
                    CircleProgress(tempAnimation.value, true),
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Temperature'),
                            Text(
                              '${tempAnimation.value.toInt()}',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '°C',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter:
                    CircleProgress(humidityAnimation.value, false),
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Humidity'),
                            Text(
                              '${humidityAnimation.value.toInt()}',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '%',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                'LEDs',
                style: TextStyle(
                    fontSize: 25 , fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomPaint(
                    //put the state of the led instead of false
                    foregroundPainter:
                    SimpleCircle(false),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Led 1'),
                            Text(
                              'OFF',
                              style: TextStyle(
                                  fontSize: 25 , fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    //put the state of the led instead of false
                    foregroundPainter:
                    SimpleCircle(true),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Led 2'),
                            Text(
                              'ON',
                              style: TextStyle(
                                  fontSize: 25 , fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    //put the state of the led instead of false
                    foregroundPainter:
                    SimpleCircle(false),
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Led 3'),
                            //change the status
                            Text(
                              'OFF',
                              style: TextStyle(
                                  fontSize: 25 , fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Window',
                style: TextStyle(
                    fontSize: 25 , fontWeight: FontWeight.bold),
              ),
              SlideServo(),

            ],
          )
              : Text(
            'Loading...',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
      ),
    );
  }
}
