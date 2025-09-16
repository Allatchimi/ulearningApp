import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/api/course_api.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/global.dart';
//import 'package:ulearning_app/global.dart';
part 'home_controller.g.dart';

//flutter pub run build_runner watch --delete-conflicting-outputs

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() => 0;

  void setIndex(int value) {
    state = value;
    //  print(state);
  }
}

@Riverpod(keepAlive: true)
class HomeUserProfile extends _$HomeUserProfile {
  @override
  FutureOr<User> build() {
    final user = Global.storageServices.getUserProfile();
    return user ?? _getDefaultUser();
  }

  User _getDefaultUser() {
    return User(
      id: 0,
      name: "Guest",
      firstName: "Guest",
      lastName: "User",
      email: "guest@example.com",
      provider: "LOCAL",
      profileImageUrl: "",
      emailVerified: false,
      roles: ["USER"],
    );
  }
}

@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList {
  Future<List<CourseItem>?> fetchCourseList() async {
    try {
      final List<CourseItem> result = await CourseAPI.courseList();
      return result;
    } catch (e) {
      print("Erreur lors de la récupération de la liste des cours: $e");
      return null;
    }
  }

  // Override de la méthode build
  @override
  FutureOr<List<CourseItem>?> build() async {
    // Retourne la liste des cours ou null en cas d'erreur
    return await fetchCourseList();
  }
}
