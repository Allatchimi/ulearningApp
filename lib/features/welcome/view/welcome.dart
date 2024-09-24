import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/welcome/view/widgets.dart';


final indexProvider = StateProvider<int>((ref)=>0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});


  final PageController _controller = PageController();
  int dotsIndex = 0;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //print('my dots value is $dotsIndex');
    final index = ref.watch(indexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin:  EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                 // print("my dots value is $dotsIndex");
                  onPageChanged: (value) {
                    ref.read(indexProvider.notifier).state=value;
                  },
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  children: [
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/image1.jpg",
                        title: "First see Learning",
                        subtitle:
                            "Forget about peper an knowledge in one learning",
                        textb: 'next',
                        context: context,
                        index: 1),
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/image2.jpg",
                        title: "First see Learning",
                        subtitle:
                            "Forget about peper an knowledge in one learning",
                        textb: 'next2',
                        context: context,
                        index: 2),
                    appOnboardingPage(_controller,
                        imagePath: "assets/images/image3.jpg",
                        title: "First see Learning",
                        subtitle:
                            "Forget about peper an knowledge in one learning",
                        textb: 'Get Started',
                        context: context,
                        index: 3),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  child: DotsIndicator (
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(24.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
