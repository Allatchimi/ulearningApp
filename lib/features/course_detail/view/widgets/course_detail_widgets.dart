import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/lesson_detail/controller/lesson_controller.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailThumbnail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return AppBoxDecoratioonImage(
        imagePath: "${AppConstants.SERVER_API_URL}${courseItem.thumbnail!}",
        width: 325.w,
        height: 150.h,
        fit: BoxFit.cover);
  }
}

class CourseDetailIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIconText({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    print("le nom dans course item ${courseItem.description}");
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(AppRoutesNames.AUTHOR,
                arguments: {
                  "teacherName": courseItem.teacherName ?? "Nom inconnu"
                }),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              decoration: appBoxShadow(radius: 7),
              child: const Text10Normal(
                text: "Author Page",
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(
                  imagePath: ImageRes.profile,
                ),
                SizedBox(width: 6.w),
                Text11Normal(
                  text: courseItem.follow.toString(),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(
                  imagePath: ImageRes.play,
                ),
                SizedBox(width: 6.w),
                Text11Normal(
                  text: courseItem.lessonNum.toString(),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(
                  imagePath: ImageRes.boy,
                ),
                SizedBox(width: 6.w),
                Text11Normal(
                  text: courseItem.downNum.toString(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailDescription({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: "Course Description",
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          Text11Normal(
            textAlign: TextAlign.start,
            // text: "Description Syncing files to device iPhone 15 Pro Max Performing hot reload Description Syncing files to device iPhone 15 Pro Max",
            text: courseItem.description ?? "No Description",
            color: AppColors.primaryThreeElementText,
          ),
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: const AppButton(buttonName: "Go Buy"));
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text14Normal(
          text: "The Course Includes",
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 16.w),
        CourseInfo(
            icon: Icons.video_library,
            length: courseItem.videoLen,
            infoText: "Hours Video"),
        SizedBox(height: 10.w),
        CourseInfo(
            icon: Icons.library_books,
            length: courseItem.lessonNum,
            infoText: "Nomber of files"),
        SizedBox(height: 10.w),
        CourseInfo(
            icon: Icons.download,
            length: courseItem.downNum,
            infoText: "Number of items to download"),
      ],
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String? infoText;
  final int? length;
  final double width;
  final double height;
  final Color borderColor;
  final IconData icon;

  const CourseInfo({
    super.key,
    this.width = 40,
    this.height = 40,
    this.infoText = "item",
    this.length,
    this.borderColor = AppColors.primaryElement,
    this.icon = Icons.send_and_archive_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width.w,
          height: height.h,
          decoration: appBoxShadow(
            border: Border.all(color: borderColor),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryBackground,
          ),
        ),
        SizedBox(width: 10),
        Text11Normal(
          fontWeight: FontWeight.bold,
          color: AppColors.primarySecondaryElementText,
          text: length == Null ? "0 $infoText" : "$length $infoText",
        )
      ],
    );
  }
}

class LessonInfo extends StatelessWidget {
  final List<Lesson> lessonData;
  final WidgetRef ref;
  const LessonInfo({super.key, required this.lessonData, required this.ref});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        lessonData.isNotEmpty
            ? const Text14Normal(
                text: "Lesson List",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              )
            : Center(
                child: const Text14Normal(
                  text: "Lesson List is Empty",
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
        SizedBox(height: 10.h),
        ListView.builder(
            shrinkWrap: true,
            itemCount: lessonData.length,
            itemBuilder: (_, index) {
              final lesson = lessonData[index];
              return Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                width: 325.w,
                height: 80.h,
                decoration: appBoxShadow(
                  radius: 20,
                  sR: 2,
                  bR: 3,
                  color: AppColors.primaryBackground,
                ),
                child: InkWell(
                  onTap: () {
                    ref.watch(lessonVideosControllerProvider(
                        lessonId: lessonData[index].id!));
                    Navigator.of(context).pushNamed("/lesson_detail",
                        arguments: {"id": lessonData[index].id});
                  },
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBoxDecoratioonImage(
                        width: 60.w,
                        height: 60.w,
                        imagePath:
                            "${AppConstants.SERVER_API_URL}${lessonData[index].thumbnail}",
                        fit: BoxFit.cover,
                      ),

                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text13Normal(text: lessonData[index].name!),
                          Text10Normal(
                              text: lesson.description ?? "No Description"),
                        ],
                      ),
                  

                      // pour le chevron sa manque l image
                      //const AppImage(imagePath: ImageRes.defaultImage,width: 24,height: 24,),
                      //const Text16Normal(text: ">"),
                      /*                         IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/lesson_detail",
                              arguments: {"id": lessonData[index].id});
                        },
                      ), */
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}
