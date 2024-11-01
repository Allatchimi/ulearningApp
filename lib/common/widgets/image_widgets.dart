import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/image_res.dart';

class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
 const  AppImage({super.key,this.height = 16,this.width = 16, this.imagePath =ImageRes.defaultImage});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath.isEmpty ? "assets/icons/default.png": imagePath,
      width: width.w,
      height: height.h,
    );
  }
}


Widget appImageWithColor(
    {String imagePath = "",
      double width = 16,
      double height = 16,
      Color color = AppColors.primaryElement,

    }) {
  return Image.asset(
    imagePath.isEmpty ? "assets/icons/default.png": imagePath,
    width: width.w,
    height: height.h,
  );
}
