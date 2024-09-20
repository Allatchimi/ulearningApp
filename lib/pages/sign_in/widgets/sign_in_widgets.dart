import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/* preferredSize  widget gives  you a height or space the appbar downword and and
 we can put  child in the given spaces
*/
AppBar buildAppBar() {
  return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.red,
            height: 1,
          )),
      title: text16Normal(
        text: "Login",
        color: AppColors.primaryText,
      ));
}

Widget thirdPartyLogin() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/facebook.png"),
        _loginButton("assets/icons/mac-os1.png")
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(imagePath),
    ),
  );
}

Widget appTextField(
    {String text = "",
    String iconName = "",
    hintText = "Type your info",
    bool obscureText = false}) {
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
              Container(
                width: 280.w,
                height: 50.h,
                padding: EdgeInsets.only(left: 10.w),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      //deffault border without any input
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.transparent,
                      )),
                      //focused border is with input
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                  onChanged: (value) {},
                  maxLines: 1,
                  autocorrect: false,
                  //by default it 's false
                  obscureText: obscureText,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
