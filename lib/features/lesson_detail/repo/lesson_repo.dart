
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class LessonRepo{
  static  Future<List<LessonVideoItem>?> LessonDetail({required int id}) async{
    var response = await HttpUtil().post("api/LessonVideoItem/byLesson/$id");

     //print("Response data des video dans repo lessondetail : ${response}");
    // print("Response data dans repo pour List lesson : ${response}");
    if (response != null && response is List) {
      // return Lesson.fromJson(response as Map<String, dynamic>);
      return response.map((item) => LessonVideoItem.fromJson(item as Map<String, dynamic>)).toList();
    } else {
      throw Exception("API response is not a valid JSON object");
    }
  }
}