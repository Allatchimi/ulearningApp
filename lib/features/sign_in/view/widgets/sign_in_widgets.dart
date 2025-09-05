import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/sign_in/controller/sign_in_controller.dart';



Widget thirdPartyLogin(WidgetRef ref, SignInController controller) {
   
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png", () {
          controller.handleSignIn(ref, isSocialLogin: true);
          // Implémentez la logique spécifique à Google
        }),
        _loginButton("assets/icons/facebook.png",() {
          controller.handleSignIn(ref, isSocialLogin: true);
          
        }),
        _loginButton("assets/icons/mac-os1.png",() {
          controller.handleSignIn(ref, isSocialLogin: true);
          
        })
      ],
    ),
  );
}

Widget _loginButton(String imagePath ,VoidCallback onTap) {
  return GestureDetector(
    onTap:  onTap,
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(imagePath),
    ),
  );
}

