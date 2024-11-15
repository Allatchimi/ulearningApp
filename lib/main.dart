import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/utils/app_style.dart';


import 'global.dart';


Future<void> main() async {

  await Global.init();
  runApp( const ProviderScope(child:MyApp()));

}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navKey,
            theme: AppTheme.appThemeData,
            onGenerateRoute: AppPages.generateRouteSettings,
          );
        }
    );
  }
}