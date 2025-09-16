import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

class YourCoursesScreen extends StatelessWidget {
  const YourCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppBar(text: "Mes Cours"),
      body: Center(child: Text("les cours ....")),
    );
  }
}