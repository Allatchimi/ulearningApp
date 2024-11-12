import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/api/course_api.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/global.dart';
//import 'package:ulearning_app/global.dart';
part 'home_controller.g.dart';

//flutter pub run build_runner watch --delete-conflicting-outputs

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots{

  @override
  int build()=>0;

  void setIndex(int value){
    state = value;
  //  print(state);
  }
}

@Riverpod(keepAlive: true)
class HomeUserProfile extends _$HomeUserProfile{
  @override
  FutureOr<UserProfile> build(){
    return Global.storageServices.getUserProfile();
  }

}

@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList {
  // Appel asynchrone pour récupérer la liste des cours
  Future<List<CourseItem>?> fetchCourseList() async {
    try {
      // Appel à l'API pour récupérer les cours
      final List<CourseItem> result = await CourseAPI.courseList();

      // Retourner la liste des cours
      return result;
    } catch (e) {
      // Affiche l'erreur lors de la récupération de la liste des cours
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



