import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';

import '../../../../common/widgets/text_widgets.dart';

class LessonVideos extends StatelessWidget {
  final List<LessonVideoItem> lessonVideoData;
  const LessonVideos({super.key, required this.lessonVideoData});

  @override
  Widget build(BuildContext context) {
      int index =0;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Videos  List",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold ,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: lessonVideoData.length,
              itemBuilder: (_,index){
                return Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  width: 325.w,
                  height: 80.h,
                  decoration: appBoxShadow(
                    radius: 5,
                    sR: 2,
                    bR: 3,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: InkWell(
                    onTap: (){
                     // Navigator.of(context).pushNamed("/lesson_detail");
                    },
                    child:  Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppBoxDecoratioonImage(
                          width: 60.w,
                          height: 60.w,
                          imagePath: lessonVideoData[index].thumbnail!,
                          fit: BoxFit.fill,
                        ),

                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text13Normal(text: "Nom de Video : ${lessonVideoData[index].name!}"),
                            Text11Normal(text:"Nom de Lesson : ${lessonVideoData[index].lessonName!}"),
                          ],
                        ),
                        Expanded(child: Container()),
                        // pour le chevron sa manque l image
                        //const AppImage(imagePath: ImageRes.defaultImage,width: 24,height: 24,),
                        // Text16Normal(text: ">"),
                         Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
