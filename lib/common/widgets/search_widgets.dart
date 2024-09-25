import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/app_textfield.dart';


Widget searchBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //search text
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w,top: 5.h),
              child:const Icon(
                  Icons.search,
                  color:AppColors.primaryFourElementText,
              ),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: appTextFieldOnly(width: 40,height: 280,hintText: "search your course  ..."),
            )
          ],
        ),
      ),
      // search button
      GestureDetector(
        onTap: (){

        },
        child: Container(
          padding: EdgeInsets.all(5.w),
          width: 40.w,
          height: 40.h,
          decoration :appBoxShadow(
            border: Border.all(color: AppColors.primaryElement),

          ),
          child: const Icon(
              color:AppColors.primaryBackground,
              Icons.send_and_archive_rounded
          ),
        ),
      )
    ],
  );
}