import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/course_detail/repo/course_repo.dart';
part 'course_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(CourseDetailControllerRef ref,
    {required int index}) async {
  print("🔄 Fetching course detail for ID: $index");

  try {
    final course = await CourseRepo.courseDetail(id: index);

    if (course != null) {
      print("✅ Course found: ${course.name}");
      return course;
    } else {
      print("❌ Course not found for ID: $index");
      return null;
    }
  } catch (e) {
    print("❌ Error in courseDetailController: $e");
    rethrow;
  }
}

@riverpod
Future<List<Lesson>> courseLessonListController(
    CourseLessonListControllerRef ref,
    {required int index}) async {
  print("🔄 Fetching lessons for course ID: $index");

  try {
    final lessons = await CourseRepo.courseLessonList(id: index);
    print("✅ Found ${lessons.length} lessons");

    return lessons;
  } catch (e) {
    print("❌ Error in courseLessonListController: $e");
    rethrow;
  }
}
