import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class Text24Normal extends StatelessWidget {
 final  String text ;
    final  Color color;
    final FontWeight fontWeight;
  const Text24Normal({
    super.key,
    this.text = "",
    this.color =AppColors.primaryElement,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: fontWeight,
      ),
    );
  }
}

/*
Widget text24Normal({String text = " ",
  Color color = AppColors.primaryElement,FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: fontWeight,
    ),
  );
}
*/
class Text16Normal extends StatelessWidget {
  final String text ;
  final  Color color ;
  const Text16Normal(
      {super.key,
        this.text="",
        this.color = AppColors.primarySecondaryElementText
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text14Normal({
    super.key,
     this.text ="",
     this.color= AppColors.primaryThreeElementText
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

Widget textUderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}
