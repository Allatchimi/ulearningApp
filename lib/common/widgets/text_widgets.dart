import 'package:flutter/material.dart';

Widget text24Normal({String text =" ",Color color = Colors.blue}){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color, fontSize: 24, fontWeight: FontWeight.normal,
    ),
  );
}

Widget text16Normal({String text =" ",Color color=Colors.blue}){
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color, fontSize: 16, fontWeight: FontWeight.normal,
    ),
  );
}