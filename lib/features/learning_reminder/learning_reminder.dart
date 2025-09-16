import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

class LearningReminderScreen extends StatelessWidget {
  const LearningReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppBar(text: "Learning Reminders"),
      body: Center(child: Text("les learning Reminders")),
    );
  }
}