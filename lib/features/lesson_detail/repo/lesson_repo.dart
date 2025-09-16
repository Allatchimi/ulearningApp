import 'package:ulearning_app/common/models/api_response.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class LessonRepo {
  static Future<List<LessonVideoItem>> getLessonVideos({required int id}) async {
    try {
      // ✅ UTILISEZ GET AU LIEU DE POST pour récupérer des données
      final response = await HttpUtil().get("/api/LessonVideoItem/byLesson/$id");

      // ✅ UTILISEZ ApiResponse pour parser la réponse
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

      // ✅ Conversion en List<LessonVideoItem>
      return apiResponse.data!.map((item) {
        return LessonVideoItem.fromJson(item as Map<String, dynamic>);
      }).toList();

    } catch (e) {
      print("Error fetching lesson videos: $e");
      rethrow;
    }
  }
}