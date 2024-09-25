import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appTextField(
    {String text = "",
    TextEditingController? controller,
    String iconName = "",
    String hintText = "Type your info",
    bool obscureText = false,
    void Function(String value)? func}) {
  return Container(
    padding: EdgeInsets.only(
      left: 25.w,
      right: 25.w,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50.h,
          //color: Colors.red,
          decoration: appBoxDecorationTextField(),
          //row contain icons and textfields
          child: Row(
            children: [
              Container(
                //for showing icons
                margin: EdgeInsets.only(left: 10.w),
                child: appImage(imagePath: iconName),
                // appImage()
              ),
              //our textfield
              appTextFieldOnly(
                  controller: controller,
                  hintText: hintText,
                  func: func,
                  obscureText: obscureText),
            ],
          ),
        )
      ],
    ),
  );
}

Widget appTextFieldOnly(
    {TextEditingController? controller,
    String hintText = "Type your info",
    double width = 280,
    double height = 50,
    bool obscureText = false,
    void Function(String value)? func}) {
  return Container(
    width: width.w,
    height: height.h,
    padding: EdgeInsets.only(left: 10.w),
    child: TextField(
      controller: controller,
      onChanged: (value) => func!(value),
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top:7.h, left: 10.w),
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent,)),
          //deffault border without any input
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent,)),
          //focused border is with input
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent))
      ),
      maxLines: 1,
      autocorrect: false,
      //by default it 's false
      obscureText: obscureText,
    ),
  );
}
