import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfield.dart';
import '../../../common/widgets/button_widgets.dart';
import '../../../common/widgets/text_widgets.dart';
import '../provider/register_notifier.dart';
import '../controller/sign_up_controller.dart';




class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    // Corrige ici "initSate" en "initState"
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final regProvider = ref.watch(registerNotifierProvider);
    //final signUpController = SignUpController(ref: ref);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(text: "Register"),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      const Center(
                          child: Text14Normal(
                              text:
                                  "Enter your details bellow and free sign up ")),
                      SizedBox(
                        height: 50.h,
                      ),
                      //name text box
                      appTextField(
                        text: "Name",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your name",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserNameChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //email text box
                      appTextField(
                        text: "Email",
                        iconName: "assets/icons/user.png",
                        hintText: "Enter your email address",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //password text box
                      appTextField(
                        text: "Password",
                        iconName: "assets/icons/padlock.png",
                        obscureText: true,
                        hintText: "Enter your password",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //confirm password text box
                      appTextField(
                        text: "Confirm your Password",
                        iconName: "assets/icons/padlock.png",
                        obscureText: true,
                        hintText: "Confirm your password",
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserrePasswordChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: const Text14Normal(
                            text:
                                "By creating an account your are agreeing with our terms and conditions"),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Center(
                          child: appButton(
                        buttonName: "Sign Up",
                        isLogin: true,
                        context: context,
                        func: () => _controller.handleSignUp(),
                      )),
                      //app register button
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
