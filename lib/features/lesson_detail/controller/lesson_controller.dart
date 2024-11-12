import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/lesson_detail/repo/lesson_repo.dart';
part 'lesson_controller.g.dart';
/*
@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref,
    {required int index}) async {
  // Pass the index directly as the ID
  final response = await CourseRepo.courseDetail(id: index);
  // Check if response or data is null before accessing
  // print("Response data dans controller : ${response}");

  if (response != null && response.code == 200 && response.data != null) {
    return response.data;
  } else {
    print("for course Request failed with code: ${response?.code ?? 'No response'} or data is null");
  }
  return null;
}*/

@riverpod
Future<List<LessonVideoItem>?> courseLessonDetailController(
    CourseLessonDetailControllerRef ref,
    {required int index}) async {

  // Get the list of lessons for the course by ID
  final response = await LessonRepo.courseLessonDetail(id: index);

  // Check if response is not null and is a non-empty list
  if (response != null && response.isNotEmpty) {
    return response;
  } else {
    print("Request failed: Response is null or empty for video ID: $index");
  }
  return null;
}

