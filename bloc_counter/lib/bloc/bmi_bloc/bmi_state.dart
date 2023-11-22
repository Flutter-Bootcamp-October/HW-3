import 'package:flutter/material.dart';

abstract class BMIState{}
class InitialStateBMI extends BMIState{
  final String title = "BMI";
  final Color scaffcolor = const Color.fromARGB(255, 235, 184, 244);
  final Color titlecolor = Colors.purple;
}
class AverageState extends BMIState{
  final String title = "Average";
  final Color scaffcolor = const Color.fromARGB(255, 206, 244, 184);
  final Color titlecolor = Colors.green;
  final double bmi;
  AverageState(this.bmi);
}
class ObeseState extends BMIState{
  final String title = "Obese";
  final Color scaffcolor = const Color.fromARGB(255, 244, 188, 184);
  final Color titlecolor = Colors.red;
  final double bmi;
  ObeseState(this.bmi);
}
class OverweightState extends BMIState{
  final String title = "Overweight";
  final Color scaffcolor = const Color.fromARGB(255, 244, 201, 184);
  final Color titlecolor = const Color.fromARGB(255, 244, 124, 54);
  final double bmi;
  OverweightState(this.bmi);
}
class UnderweightState extends BMIState{
  final String title = "Underwight";
  final Color scaffcolor = const Color.fromARGB(255, 184, 204, 244);
  final Color titlecolor = Colors.blue;
  final double bmi;
  UnderweightState(this.bmi);
}
