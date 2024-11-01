import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post('api/courseList');
    return CourseListResponseEntity.fromJson(response);
  }
}