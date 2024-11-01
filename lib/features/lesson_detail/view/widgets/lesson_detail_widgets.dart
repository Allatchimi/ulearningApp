import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';

import '../../../../common/widgets/text_widgets.dart';

class LessonVideos extends StatelessWidget {
  const LessonVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
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
    );
  }
}
