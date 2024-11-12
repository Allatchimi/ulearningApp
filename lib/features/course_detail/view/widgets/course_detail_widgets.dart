import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';



class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailThumbnail({super.key,required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return AppBoxDecoratioonImage(
        imagePath: courseItem.thumbnail!,
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
            child: Row(
              children: [
                AppImage(
                  imagePath: ImageRes.profile,
                ),
                Text11Normal(
                  text: courseItem.follow.toString(),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child:  Row(
              children: [
                AppImage(
                  imagePath: ImageRes.play,
                ),
                Text11Normal(
                  text: courseItem.lessonNum.toString(),
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
  const CourseDetailDescription({super.key,required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
              text: "Course Description",
              color: AppColors.primaryText,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold,
          ),
          Text11Normal(
           // text: "Description Syncing files to device iPhone 15 Pro Max Performing hot reload Description Syncing files to device iPhone 15 Pro Max",
            text: courseItem.description!,
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
  final CourseItem courseItem;
   const CourseDetailIncludes({super.key, required this.courseItem});

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
          CourseInfo(
            imagePath: ImageRes.play,
            //imagePath: Icons.video_library.toString(),
            length: courseItem.videoLen,
            infoText: "Hours Video",
          ),
          SizedBox(height: 16.w),
           CourseInfo(
             imagePath: ImageRes.play,
               //imagePath: Icons.library_books.toString(),
             length: courseItem.lessonNum,
             infoText: "Nomber of files"
           ),
          SizedBox(height: 16.w),
           CourseInfo(
             imagePath: ImageRes.play,
             //imagePath: Icons.download.toString(),
             length: courseItem.downNum,
             infoText: "Number of items to download"
           ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String? infoText;
  final int? length;
  final String imagePath;
  const CourseInfo({super.key, this.infoText= "item", this.length, this.imagePath=ImageRes.defaultImage});

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
         Text11Normal(
          color: AppColors.primarySecondaryElementText,
         // text: "20 Hours videos",
          text: length == Null? "0 $infoText": "$length $infoText",
        )
      ],
    );
  }
}

class LessonInfo extends StatelessWidget {
  final List<Lesson> lessonData;
  const LessonInfo({super.key,required this.lessonData});
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
            itemCount: lessonData.length,
              itemBuilder: (_,index){
              final lesson = lessonData[index];
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
                    Navigator.of(context).pushNamed("/lesson_detail",
                        arguments: {
                        "id":lessonData[index].id
                        }
                    );
                  },
                  child:  Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBoxDecoratioonImage(
                        width: 60.w,
                        height: 60.w,
                        imagePath: lesson.thumbnail!,
                        fit: BoxFit.fill,
                      ),

                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text13Normal(text: lessonData[index].name! ),
                          Text10Normal(text: lesson.description ?? "No Description"),
                        ],
                      ),
                      Expanded(child: Container()),
                      // pour le chevron sa manque l image
                      //const AppImage(imagePath: ImageRes.defaultImage,width: 24,height: 24,),
                      //const Text16Normal(text: ">"),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/lesson_detail",
                              arguments: {
                              "id":lessonData[index].id
                              }
                          );
                        },
                      ),
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




