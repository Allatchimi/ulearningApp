import 'package:flutter/material.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            children: [
              appOnboardingPage(
                  _controller,
                  imagePath: "assets/images/image1.jpg",
                  title: "First see Learning",
                  subtitle: "Forget about peper an knowledge in one learning",index:1
              ),
              appOnboardingPage(
                  _controller,
                  imagePath: "assets/images/image3.jpg",
                  title: "First see Learning",
                  subtitle: "Forget about peper an knowledge in one learning",index:2
              ),
              appOnboardingPage(
                  _controller,
                  imagePath: "assets/images/image3.jpg",
                  title: "First see Learning",
                  subtitle: "Forget about peper an knowledge in one learning",index:3
              ),
            ],
          ),
          const Positioned(
            left: 20,
            bottom: 100,
            child: Text("Widget one"),
          ),
        ],
      ),
    );
  }
}
