import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final double width;
  final double height;
  final bool isLogin ;
  final BuildContext? context;
 final  void Function()? func;
  const AppButton({super.key,
    this.buttonName= "",this.width= 325,
    this.height = 50,this.isLogin= true,
    this.context,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:func,

      child: Container(
        width: width.w,
        height: height.h,
        decoration: appBoxShadow(
            color: isLogin ? AppColors.primaryElement : Colors.white,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Center(
            child: Text16Normal(
                text: buttonName,
                color: isLogin
                    ? AppColors.primaryBackground
                    : AppColors.primaryText)),
      ),
    );
  }
}
