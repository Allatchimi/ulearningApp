import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Row(
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
    ),
  );
}

// profil icons
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
        )),
    child: Image(
      width: 20.w,
      height: 20.h,
      image: AssetImage("assets/icons/edit.png"),
    ),
  );
}
// settings bottom
var imagesInfo = <String ,String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart.png",
  "Learning Reminders": "cube.png"
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
    ...List.generate(imagesInfo.length, (index) => GestureDetector(
      onTap:() => Navigator.of(context).pushNamed(AppRoutesNames.SETTINGS),
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
                  )),
              SizedBox(width: 15.w,),    
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
      )
    )
    ],
  );
}
