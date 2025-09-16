import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGlobalAppBar(text: "Author"),
      body: Center(child: Text("les author pages")),
    );
  }
}