import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widgets.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomsState();
}

class _HomsState extends ConsumerState<Home> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              const HelloText(),
              const UserName(),
              SizedBox(height: 20.h),
              searchBar(),
              SizedBox(height: 15.h),
             HomeBanner(ref: ref, controller: _controller),
             // SizedBox(height: 5.h,),
              const HomeMenuBar(),
               const CourseItemGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
