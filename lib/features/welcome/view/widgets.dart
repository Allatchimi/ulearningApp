import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/global.dart';
import '../../../common/widgets/text_widgets.dart';

class AppOnboardingPage extends StatelessWidget {

  final PageController controller;
  final String imagePath;
  final String title ;
  final  String textb;
  final  String subtitle;
  final int index;
  final BuildContext context;
  const AppOnboardingPage({
    super.key,
    required this.imagePath,
    required this.controller,
    required this.context,
    required this.subtitle,
    required this.title,
    required this.textb,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Image.asset(imagePath, fit:BoxFit.fitWidth,
          height: 400,width:500,),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Text24Normal(text: title),
        ),
        Container(
          // margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text16Normal(
              text: subtitle
          ),
        ),
        _nextButton(index,controller,textb, context),
      ],
    );
  }
}

Widget _nextButton(int index,PageController controller,textb,BuildContext context){
  return GestureDetector(
    
    onTap: (){
     // bool deviceFirstTime = Global.storageServices.getDeviceFirstOpen();
    //  print("from on tab ${deviceFirstTime}");
    if(index<3) {
      controller.animateToPage(
          index, duration: const Duration(milliseconds: 300), curve: Curves.linear
      );
    }else{
      //remember if you are first time or no
      Global.storageServices.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
       Navigator.pushNamed(context, "/signIn");
    }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100,left: 25,right: 25),
      decoration: appBoxShadow(),
      child: Center(child: Text16Normal(text: textb, color: Colors.white))
    ),
  );
}