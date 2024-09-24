import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import '../../../common/utils/app_colors.dart';

var bottomsTabs =<BottomNavigationBarItem> [
  BottomNavigationBarItem(
    icon:bottomContainer(),
    activeIcon: bottomContainer(color: AppColors.primaryElement),
    label: "Home",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(),
    //activeIcon: bottomContainer(color: AppColors.primaryElement),
    label: "Search",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(color: AppColors.primaryElement),
    //activeIcon: bottomContainer(color: AppColors.primaryElement),
    label: "Play",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(),
    //activeIcon: bottomContainer(color: AppColors.primaryElement),
    label: "Message",
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: bottomContainer(),
    //activeIcon: bottomContainer(color: AppColors.primaryElement),
    label: "Profile",
    backgroundColor: AppColors.primaryBackground,
  )
];




Widget bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath= "assets/icons/user.png",
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
   Center(child: appImage(imagePath: ImageRes.home,width: 250,height: 250),),
   Center(child: appImage(imagePath: ImageRes.search,width: 250,height: 250),),
   Center(child: appImage(imagePath: ImageRes.play,width: 250,height: 250),),
   Center(child: appImage(imagePath: ImageRes.message,width: 250,height: 250),),
   Center(child: appImage(imagePath: ImageRes.profile,width: 250,height: 250),)
   ];
   return screens[index];
}