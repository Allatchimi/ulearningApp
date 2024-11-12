import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class Text24Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text24Normal({
    super.key,
    this.text = "",
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const Text16Normal(
      {super.key,
      this.text = "",
      this.textAlign = TextAlign.center,
      this.fontWeight =FontWeight.normal,
      this.color = AppColors.primarySecondaryElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 16.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text14Normal(
      {super.key,
      this.text = "",
      this.fontWeight= FontWeight.normal,
      this.color = AppColors.primaryThreeElementText});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text13Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const Text13Normal(
      {super.key,
        this.text = "",
        this.textAlign = TextAlign.start,
        this.fontWeight =FontWeight.bold,
        this.color = AppColors.primaryText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 13.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text11Normal(
      {super.key,
        this.text = "",
        this.fontWeight =FontWeight.normal,
        this.color = AppColors.primaryElement});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 11.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  const Text10Normal(
      {super.key,
        this.text = "",
        this.textAlign= TextAlign.center,
        this.fontWeight=  FontWeight.normal,
        this.color = AppColors.primaryThreeElementText});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
      ),
    );
  }
}
class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double fontSize;
  const FadeText(
      {super.key,
        this.text = "",
        this.textAlign= TextAlign.left ,
        this.fontSize = 10,
        this.fontWeight=  FontWeight.bold,
        this.color = AppColors.primaryElementText});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      maxLines: 1,
      textAlign: textAlign,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
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
