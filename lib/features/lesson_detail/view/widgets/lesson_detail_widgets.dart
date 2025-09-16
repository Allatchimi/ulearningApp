import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';

import '../../../../common/widgets/text_widgets.dart';

class LessonVideos extends StatelessWidget {
  final List<LessonVideoItem> lessonVideoData;
  final Function(LessonVideoItem) onVideoTap;

  const LessonVideos({
    super.key, 
    required this.lessonVideoData,
    required this.onVideoTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14Normal(
            text: "Videos List",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: lessonVideoData.length,
            itemBuilder: (context, index) {
              final video = lessonVideoData[index];
              return Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: 325.w,
                height: 80.h,
                decoration: appBoxShadow(
                  radius: 5,
                  sR: 2,
                  bR: 3,
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () => onVideoTap(video),
                  child: Row(
                    children: [
                      AppBoxDecoratioonImage(
                        width: 60.w,
                        height: 60.w,
                        imagePath: "${AppConstants.SERVER_API_URL}${video.thumbnail!}",
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text13Normal(
                              text: video.name ?? "Unnamed video",
                      
                            ),
                            SizedBox(height: 4.h),
                            Text11Normal(
                              text: video.lessonName ?? "No lesson name",
                        
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16.w),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}