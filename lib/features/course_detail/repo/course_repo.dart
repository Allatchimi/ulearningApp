import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';


class CourseRepo{

  static Future<CourseDetailResponseEntity?> courseDetail({required int id}) async{
    var response = await HttpUtil().post("api/cour/courtDetails/$id");
    if (response != null && response is Map) {
      return CourseDetailResponseEntity.fromJson(response as Map<String, dynamic>);
    } else {
      throw Exception("API response is not a valid JSON object");
    }
  }

  static  Future<List<Lesson>?> courseLessonList({required int id}) async{
    var response = await HttpUtil().post("api/lesson/byCourse/$id");
   // print("Response data dans repo pour List lesson : ${response}");
    if (response != null && response is List) {
     // return Lesson.fromJson(response as Map<String, dynamic>);
      return response.map((item) => Lesson.fromJson(item as Map<String, dynamic>)).toList();
    } else {
      throw Exception("API response is not a valid JSON object");
    }
  }
 }