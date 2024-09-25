import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key,required this.ref, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325.w,
          height: 160.h,
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
      height: 160.h,
      margin: const EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
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

    return Container(
      child: Text24Normal(
        text: Global.storageServices
            .getString(AppConstants.STORAGE_USER_PROFILE_KEY),
        //text: Global.storageServices.getUserProfile()["name"],
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText ({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: const Text24Normal(
        text: "Hello",
        color: AppColors.primaryThreeElementText,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

