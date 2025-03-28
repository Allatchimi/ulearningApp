import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

//posional option parameter
toastInfo(String  msg ,{Color backgrounColor = Colors.blue ,Color textColor = Colors.white})  {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgrounColor,
    textColor: textColor,
    fontSize: 16.sp,
  );
}