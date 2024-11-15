import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/common/utils/http_util.dart';

class CourseAPI {
  static Future<List<CourseItem>> courseList() async {
    try {
      // Effectuer la requête POST
      var response = await HttpUtil().post('api/cour/getAllCours');
      // Vérifiez que la réponse est bien une liste
      if (response is List) {
        // Mappez chaque élément de la liste à un objet CourseItem
        List<CourseItem> courses = response
            .map((item) => CourseItem.fromJson(item as Map<String, dynamic>))
            .toList();
        return courses;
      } else {
        throw Exception("La réponse de l'API n'est pas une liste");
      }
    } catch (e) {
      throw Exception("Erreur lors du chargement des cours : $e");
    }
  }
}
