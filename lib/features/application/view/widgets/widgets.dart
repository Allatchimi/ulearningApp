import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/course_detail/view/course_detail.dart';
import 'package:ulearning_app/features/lesson_detail/lesson_detail.dart';
import 'package:ulearning_app/features/profil/view/course.dart';
import 'package:ulearning_app/features/profil/view/your_course.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/image_res.dart';
import '../../../../common/widgets/image_widgets.dart';
import '../../../home/view/home.dart';
import '../../../profil/view/profil.dart';


var bottomsTabs =<BottomNavigationBarItem> [
  BottomNavigationBarItem(
    icon:bottomContainer(imagePath:ImageRes.home, color: AppColors.primaryFourElementText),
    activeIcon: bottomContainer(imagePath:ImageRes.home,color: AppColors.primaryElement),
    label: "Home",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(imagePath:ImageRes.search,color: AppColors.primaryFourElementText),
    activeIcon: bottomContainer(imagePath:ImageRes.search ,color: AppColors.primaryElement),
    label: "Search",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(imagePath:ImageRes.play ,color: AppColors.primaryFourElementText),
    activeIcon: bottomContainer(imagePath:ImageRes.play ,color: AppColors.primaryElement),
    label: "Play",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(imagePath:ImageRes.message,color: AppColors.primaryFourElementText),
    activeIcon: bottomContainer(imagePath:ImageRes.message ,color: AppColors.primaryElement),
    label: "Message",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(imagePath:ImageRes.profile,color: AppColors.primaryFourElementText ),
    activeIcon: bottomContainer(imagePath:ImageRes.profile, color: AppColors.primaryElement),
    label: "Profile",
    backgroundColor: AppColors.primaryBackground,
  )
];


Widget bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath= "assets/icons/default.png",
  Color color = AppColors.primaryFourElementText
}){
  return SizedBox(
    width: 15.w,
    height: 15.h,
    child: appImageWithColor(
      imagePath: imagePath,
      color: color
    ),
  );
}

Widget appScreens({int index=0}){
   List<Widget> screens = [
   const Home(),
   YourCoursesScreen(),
   const CourseDetail(),
   CoursesScreen(),
   //const Center(child: AppImage(imagePath: ImageRes.play,width: 200,height: 200),),
  // const  Center(child: AppImage(imagePath: ImageRes.profile,width: 200,height: 200),)
     ProfileScreen(),
   ];
   return screens[index];
}