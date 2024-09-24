import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';


Widget appImage(
    {String imagePath = "",
    double width = 16,
    double height = 16}) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png": imagePath,
    width: width.w,
    height: height.h,
  );
}

Widget appImageWithColor(
    {String imagePath = "",
      double width = 16,
      double height = 16,
      Color color = AppColors.primaryElement,

    }) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/user.png": imagePath,
    width: width.w,
    height: height.h,
  );
}
