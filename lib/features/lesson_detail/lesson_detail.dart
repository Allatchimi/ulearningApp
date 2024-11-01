import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/lesson_detail/view/widgets/lesson_detail_widgets.dart';

class LessonDetail extends StatelessWidget {
  const LessonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Lesson detail"),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                const Text16Normal(
                  text: "Titre de video",
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10.h),
                AppBoxDecoratioonImage(
                    width: 325.w,
                    height: 160.h,
                    imagePath: ImageRes.banner2,
                    fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawGestureDetector(
                          child: AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.play,
                      )),
                      SizedBox(width: 15.h),
                      RawGestureDetector(
                          child: AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.play,
                      )),
                      SizedBox(width: 15.h),
                      RawGestureDetector(
                          child: AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.play,
                      )),
                    ],
                  ),
                ),
                const LessonVideos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
