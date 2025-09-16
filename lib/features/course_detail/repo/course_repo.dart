import 'dart:convert';

import 'package:ulearning_app/common/models/api_response.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class CourseRepo {
  static Future<CourseItem?> courseDetail({required int id}) async {
    try {
      final response = await HttpUtil().get("/api/cours/courtDetails/$id");
      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response,
        (data) {
          if (data is Map<String, dynamic>) return data;
          if (data is String) return jsonDecode(data) as Map<String, dynamic>;
          throw Exception("Unexpected data type: ${data.runtimeType}");
        },
      );

      if (!apiResponse.isSuccess()) throw Exception(apiResponse.message);
      return CourseItem.fromJson(apiResponse.data ?? {});
    } catch (e) {
      print("Course detail error: $e");
      rethrow;
    }
  }

  static Future<List<Lesson>> courseLessonList({required int id}) async {
    try {
      // ✅ UTILISEZ GET AU LIEU DE POST pour récupérer des données
      final response = await HttpUtil().get("/api/lessons/byCourse/$id");

      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response,
        (data) => data as List<dynamic>,
      );

      if (!apiResponse.isSuccess()) {
        throw Exception("API Error: ${apiResponse.message}");
      }

      if (apiResponse.data == null) {
        return []; // ✅ Retourne une liste vide au lieu de null
      }

      // ✅ Conversion en List<Lesson>
      return apiResponse.data!.map((item) {
        return Lesson.fromJson(item as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error fetching lessons: $e");
      rethrow;
    }
  }
}
