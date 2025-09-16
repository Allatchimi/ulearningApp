import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

class BuyCourseScreen extends StatelessWidget {
  const BuyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppBar(text: "Buy Course"),
      body: Center(child: Text("Buy course")),
    );
  }
}