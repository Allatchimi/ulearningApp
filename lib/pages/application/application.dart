import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/pages/application/notifier/application_nav_notifier.dart';
import 'package:ulearning_app/pages/application/widgets/widgets.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
 int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(text: "Home Page"),
          body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration:appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: index,
              items:bottomsTabs,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
              onTap: (value){
                ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}
