import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

// Variables (à déplacer dans un fichier séparé ou dans la classe)
final Map<String, String> imagesInfo = {
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart.png",
  "Learning Reminders": "cube.png"
};
// Ajoutez cette map dans votre fichier
final Map<String, String> routeMapping = {
  "Settings": AppRoutesNames.SETTINGS,
  "Payment details": AppRoutesNames.PAYMENT_DETAIL,
  "Achievement": AppRoutesNames.ACHIEVEMENT,
  "Love": AppRoutesNames.LOVE,
  "Learning Reminders": AppRoutesNames.LEARNING_REMINDER,
  "My Courses":AppRoutesNames.MY_COURS,
  "Buy Courses":AppRoutesNames.BUY_COURSE,
  "4.5":AppRoutesNames.STAR
};

final Map<String, String> info = {
  "My Courses": "settings.png",
  "Buy Courses": "credit-card.png",
  "4.5": "cube.png"
};

AppBar buildAppbar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset("assets/icons/menu-burger.png"),
        ),
        Text(
          "Profile",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset("assets/icons/more-vertical.png"),
        ),
      ],
    ),
  );
}

Widget profileIconsAndEditBottom() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 8.w),
    height: 80.h,
    width: 80.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/man.png"),
      ),
    ),
    child: Image(
      width: 20.w,
      height: 20.h,
      image: AssetImage("assets/icons/edit.png"),
    ),
  );
}

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () {
            final routeName = routeMapping[imagesInfo.keys.elementAt(index)] 
                            ?? AppRoutesNames.HOME;
            Navigator.of(context).pushNamed(routeName);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    "assets/icons/${imagesInfo.values.elementAt(index)}",
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildList(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 20.h),
      Padding(
        padding: EdgeInsets.only(left: 20.w, right: 16.w),
        child: Row(
          children: List.generate(info.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                    final routeName = routeMapping[info.keys.elementAt(index)] 
                                    ?? AppRoutesNames.HOME;
                    Navigator.of(context).pushNamed(routeName);
                  },
                  child: Container(
                  margin: EdgeInsets.only(right: 10.w),
                  child: Container(
                    width: 150.w,
                    height: 60.h,
                    padding: EdgeInsets.all(7.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.w),
                      color: AppColors.primaryElement,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 2.w),
                        Image.asset(
                          "assets/icons/${info.values.elementAt(index)}",
                          width: 18.w,
                          height: 18.h,
                          color: Colors.white,
                        ),
                        SizedBox(height: 6.w),
                        Text(
                          info.keys.elementAt(index),
                          style: TextStyle(
                            color: AppColors.primaryElementText,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    ],
  );
}