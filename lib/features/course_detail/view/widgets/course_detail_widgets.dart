import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/app_shadow.dart';
import '../../../../common/widgets/button_widgets.dart';
import '../../../../common/widgets/image_widgets.dart';
import '../../../../common/widgets/text_widgets.dart';

class CourseDetailThumbnail extends StatelessWidget {
  const CourseDetailThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBoxDecoratioonImage(
        imagePath: ImageRes.banner1,
        width: 325.w,
        height: 150.h,
        fit: BoxFit.cover);
  }
}

class CourseDetailIconText extends StatelessWidget {
  const CourseDetailIconText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
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
            child: const Row(
              children: [
                AppImage(
                  imagePath: ImageRes.profile,
                ),
                Text11Normal(
                  text: "0",
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: const Row(
              children: [
                AppImage(
                  imagePath: ImageRes.play,
                ),
                Text11Normal(
                  text: "0",
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
  const CourseDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
              text: "Course Description",
              color: AppColors.primaryText,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold,
          ),
          Text11Normal(
            text: "Description Syncing files to device iPhone 15 Pro Max Performing hot reload Description Syncing files to device iPhone 15 Pro Max",
            color: AppColors.primaryThreeElementText,
          ),
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const  CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
        child: const AppButton(buttonName: "Go Buy")
    );
  }
}

class CourseDetailIncludes extends StatelessWidget {
  const CourseDetailIncludes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          const Text14Normal(
            text: "The Course Includes",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold ,
          ),
          SizedBox(height: 16.w),
          const CourseInfo(imagePath: ImageRes.play),
          SizedBox(height: 16.w),
          const CourseInfo(imagePath: ImageRes.play),
          SizedBox(height: 16.w),
          const CourseInfo(imagePath: ImageRes.play),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  const CourseInfo({super.key, this.imagePath=ImageRes.defaultImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: AppImage(
            imagePath: imagePath,
            width: 30,
            height: 30,
          ),
        ),
        const Text11Normal(
          color: AppColors.primarySecondaryElementText,
          text: "20 Hours videos",
        )
      ],
    );
  }
}

class LessonInfo extends StatelessWidget {
  const LessonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Lesson List",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold ,
          ),
          SizedBox(height: 10.h),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
              itemBuilder: (_,index){
              return Container(
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                width: 325.w,
                height: 80.h,
                decoration: appBoxShadow(
                  radius: 10,
                  sR: 2,
                  bR: 3,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("/lesson_detail");
                  },
                  child:  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBoxDecoratioonImage(
                        width: 60.w,
                        height: 60.w,
                        imagePath: ImageRes.banner2,
                        fit: BoxFit.fill,
                      ),

                      SizedBox(width: 8.w),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text13Normal(text: "This first lesson "),
                          Text10Normal(text: "This first description "),
                        ],
                      ),
                      Expanded(child: Container()),
                      // pour le chevron sa manque l image
                      //const AppImage(imagePath: ImageRes.defaultImage,width: 24,height: 24,),
                      const Text16Normal(text: ">"),
                    ],
                  ),
                ),
              );
            }
            ),
          /*Container(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            width: 325.w,
            height: 80.h,
            decoration: appBoxShadow(
              radius: 10,
              sR: 2,
              bR: 3,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: InkWell(
              onTap: (){},
              child:  Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBoxDecoratioonImage(
                    width: 60.w,
                    height: 60.w,
                    imagePath: ImageRes.banner2,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(width: 8.w),
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text13Normal(text: "This first lesson "),
                        Text10Normal(text: "This first description "),
                      ],
                    ),
                    Expanded(child: Container()),
                    // pour le chevron sa manque l image
                    //const AppImage(imagePath: ImageRes.defaultImage,width: 24,height: 24,),
                    const Text16Normal(text: ">"),
                ],
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}




