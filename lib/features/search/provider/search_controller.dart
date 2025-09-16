import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/api/course_api.dart';
import 'package:ulearning_app/common/models/entities.dart';

part 'search_controller.g.dart';

@riverpod
class SearchCourseList extends _$SearchCourseList {
  @override
  Future<List<CourseItem>> build(String keyword) async {
    //if (keyword.isEmpty) return [];
    return CourseAPI.searchCourses(keyword: keyword);
  }
}
