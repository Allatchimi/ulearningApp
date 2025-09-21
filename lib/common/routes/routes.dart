
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/features/achievement/achievement_screen.dart';
import 'package:ulearning_app/features/author/view/author.dart';
import 'package:ulearning_app/features/bay_course/buy_course.dart';
import 'package:ulearning_app/features/course_detail/view/course_detail.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/features/learning_reminder/learning_reminder.dart';
import 'package:ulearning_app/features/love/love_screen.dart';
import 'package:ulearning_app/features/my_cours/my_cours.dart';
import 'package:ulearning_app/features/payment/payment.dart';
import 'package:ulearning_app/features/profil/view/course.dart';
import 'package:ulearning_app/features/profil/view/profil.dart';
import 'package:ulearning_app/features/profil/view/your_course.dart';
import 'package:ulearning_app/features/profile/settings/settings_page.dart';
import 'package:ulearning_app/features/search/view/search.dart';
import 'package:ulearning_app/features/star/star.dart';

import '../../features/application/view/application.dart';
import '../../features/lesson_detail/view/lesson_detail.dart';
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
      RouteEntity(path: AppRoutesNames.SETTINGS, page:  SettingsPage()),
      RouteEntity(path: AppRoutesNames.SEARCH, page:   SearchPage()),
      RouteEntity(path: AppRoutesNames.ACHIEVEMENT, page: AchievementScreen()),
      RouteEntity(path: AppRoutesNames.BUY_COURSE, page:   BuyCourseScreen()),
      RouteEntity(path: AppRoutesNames.LEARNING_REMINDER, page:  LearningReminderScreen()),
      RouteEntity(path: AppRoutesNames.LOVE, page:   LoveScreen()),
      RouteEntity(path: AppRoutesNames.MY_COURS, page:   MyCourseScreen()),
      RouteEntity(path: AppRoutesNames.PAYMENT_DETAIL, page:   PaymentScreen()),
      RouteEntity(path: AppRoutesNames.STAR, page:   StarScreen()),
      RouteEntity(path: AppRoutesNames.AUTHOR, page:   AuthorScreen()),
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
