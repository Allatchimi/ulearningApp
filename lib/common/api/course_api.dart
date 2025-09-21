import 'package:ulearning_app/common/models/api_response.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class CourseAPI {
  static Future<List<CourseItem>> courseList() async {
    try {
      // ✅ UTILISEZ get() AU LIEU DE post()
      final response = await HttpUtil().get('/api/cours/getAllCours');

      final apiResponse = ApiResponse<List<dynamic>>.fromJson(
        response,
        (data) => data as List<dynamic>,
      );
      print("🎯 API Status: ${apiResponse.status}");
      print("📝 API Message: ${apiResponse.message}");
      print("📊 Data type: ${apiResponse.data}");
      print("🔢 Number of courses: ${apiResponse.data?.length}");

      if (!apiResponse.isSuccess()) {
        throw Exception("API Error: ${apiResponse.message}");
      }
      if (apiResponse.data is! List) {
        throw Exception("La réponse de l'API n'est pas une liste");
      }

      final courses = apiResponse.data!.map((item) {
        return CourseItem.fromJson(item as Map<String, dynamic>);
      }).toList();
      // print("cours image url: ${courses[5]}");

      return courses;
    } catch (e) {
      throw Exception("Erreur lors du chargement des cours : $e");
    }
  }

  static Future<List<CourseItem>> searchCourses({
    String? keyword,
    double? minPrice,
    double? maxPrice,
    int? score,
    String? categoryName,
    String? teacherName,
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await HttpUtil().get(
        '/api/cours/searchCour',
        queryParameters: {
          if (keyword != null && keyword.isNotEmpty) 'kw': keyword,
          if (minPrice != null) 'minPrice': minPrice,
          if (maxPrice != null) 'maxPrice': maxPrice,
          if (score != null) 'score': score,
          if (categoryName != null) 'categoryName': categoryName,
          if (teacherName != null) 'teacherName': teacherName,
          'page': page,
          'size': size,
        },
      );

      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response,
        (data) => data as Map<String, dynamic>,
      );

      if (!apiResponse.isSuccess()) {
        throw Exception("API Error: ${apiResponse.message}");
      }

      final content = apiResponse.data?['content'] as List<dynamic>? ?? [];
      return content.map((item) => CourseItem.fromJson(item)).toList();
    } catch (e) {
      throw Exception("Erreur recherche cours: $e");
    }
  }
}

/* GET - Récupérer des données
final users = await HttpUtil().get('/api/users');

// POST - Créer un nouvel utilisateur
final newUser = await HttpUtil().post('/api/users', 
  data: {'name': 'John', 'email': 'john@email.com'}
);

// PUT - Mettre à jour un utilisateur
final updatedUser = await HttpUtil().put('/api/users/1',
  data: {'name': 'John Updated'}
);

// DELETE - Supprimer un utilisateur
await HttpUtil().delete('/api/users/1'); */
