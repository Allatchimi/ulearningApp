import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/widgets/app_shadow.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.ref, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325.w,
          height: 200.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: const [
              BannerContainer(imagePath: ImageRes.banner1),
              BannerContainer(imagePath: ImageRes.banner2),
              BannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        DotsIndicator(
          position: ref.watch(homeScreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(24.0, 8.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w),
              )),
        ),
      ],
    );
  }
}

class BannerContainer extends StatelessWidget {
  final String imagePath;
  const BannerContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 200.h,
      margin: const EdgeInsets.only(right:3,left:3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = Global.storageServices.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "User";
    return Text24Normal(
      text: userName,
     // text: Global.storageServices.getString(AppConstants.STORAGE_USER_PROFILE_KEY),
      //text: Global.storageServices.getUserProfile().access_token==null?Container(),
      fontWeight: FontWeight.bold,
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text24Normal(
      text: "Hello",
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.bold,
    );
  }
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all course
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Choise your course ",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See All ",
                  color: AppColors.primaryThreeElementText,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        //court text
        SizedBox(height: 20.h,),
        Row(
          children: [
            Container(
              decoration: appBoxShadow(
                color: AppColors.primaryElement,
                radius: 7.w,
              ),
              padding: EdgeInsets.only(
                  left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
              child: const Text11Normal(
                  text: "All", color: AppColors.primaryElementText),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                  text: "Popular", color: AppColors.primaryThreeElementText
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: const Text11Normal(
                  text: "Newest", color: AppColors.primaryThreeElementText
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing:  40,
        ),
        itemCount: 12,
        itemBuilder: (_,int index){
           return const AppImage();
        }
    );
  }
}


AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         // AppImage(width: 18.w, height: 12.h, imagePath: ImageRes.menu1),
          const Icon(Icons.menu),
          GestureDetector(
            child: const AppBoxDecoratioonImage(),
          ),
        ],
      ),
    ),
  );
}
