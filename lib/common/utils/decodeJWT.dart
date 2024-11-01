import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

String? decodeJWT(String token) {
  try {
    // Décodage du JWT sans vérification de la signature
    final jwt = JWT.decode(token);
    final payload = jwt.payload;
    print('Payload: ${jwt.payload}');
    // Récupérer le nom ou autre information pertinente
    return payload['name'] ?? payload['username'] ?? payload['preferred_username'] ?? "Nom non disponible";
  } catch (e) {
    print("Erreur lors du décodage du token : $e");
    return null;
  }
}
