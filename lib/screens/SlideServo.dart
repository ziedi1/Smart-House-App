import 'package:flutter/material.dart';
class SlideServo extends StatefulWidget {
  @override
  _SlideServoState createState() => _SlideServoState();
}

class _SlideServoState extends State<SlideServo> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      divisions: 5,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

