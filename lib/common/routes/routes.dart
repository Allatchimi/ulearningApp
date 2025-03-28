
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/features/course_detail/view/course_detail.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/features/profil/view/course.dart';
import 'package:ulearning_app/features/profil/view/profil.dart';
import 'package:ulearning_app/features/profil/view/your_course.dart';

import '../../features/application/view/application.dart';
import '../../features/lesson_detail/lesson_detail.dart';
import '../../features/sign_in/view/sign_in.dart';
import '../../features/sign_up/view/sign_up.dart';
import '../../features/welcome/view/welcome.dart';
import '../../global.dart';
import 'app_routes_names.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.SIGN_UP, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: const Home()),
      RouteEntity(path: AppRoutesNames.COURSE_DETAIL, page:  CourseDetail()),
      RouteEntity(path: AppRoutesNames.LESSON_DETAIL, page: const LessonDetail()),
      RouteEntity(path: AppRoutesNames.PROFIL, page:  ProfileScreen()),
      RouteEntity(path: AppRoutesNames.COURS, page:  CoursesScreen()),
      RouteEntity(path: AppRoutesNames.YOURCOURS, page:  YourCoursesScreen()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
     // print("clicked route is ${settings.name}");
    }

    // Check if the route exists in the defined routes
    final matchingRoute = routes().firstWhere(
          (element) => element.path == settings.name,
      orElse: () => RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()), // Default to Welcome page if no match is found
    );

    // Handle first-time open or logged-in scenario
    bool deviceFirstTime = Global.storageServices.getDeviceFirstOpen();
    if (matchingRoute.path == AppRoutesNames.WELCOME && deviceFirstTime) {
      bool isLogged = Global.storageServices.isLoggedIn();
      if (isLogged) {
        return MaterialPageRoute(
          builder: (_) => const Application(),
          settings: settings,
        );
      } else {
        return MaterialPageRoute(
          builder: (_) => const SignIn(),
          settings: settings,
        );
      }
    }

    // Return the matching route
    return MaterialPageRoute(
      builder: (_) => matchingRoute.page,
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
