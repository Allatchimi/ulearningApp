import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/global.dart';

import 'constants.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL, // Utilisez l'adresse IP correcte
     // baseUrl: "http://10.0.2.2:8080",
      connectTimeout: const Duration(seconds: 15), // Augmentez le timeout si nécessaire
      receiveTimeout: const Duration(seconds: 15),
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint("Complete URL: ${options.uri}"); 
        return handler.next(options);
      },
      onResponse: (response, handler) {
       // print("Response data: ${response.data}");
       // print("Response data type: ${response.data.runtimeType}");
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        debugPrint("URL: ${e.requestOptions.uri}");
        debugPrint("Request data: ${e.requestOptions.data}");
        debugPrint("Response data: ${e.response?.data}");

        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);

        if (shouldRetry(e)) {
          try {
            final retryResponse = await retryRequest(e.requestOptions);
            return handler.resolve(retryResponse);
          } catch (retryError) {
            print("Retry failed: $retryError");
          }
        }

        handler.next(e);
      },
    ));
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageServices.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future<dynamic> post(
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers??{}; // Combine les en-têtes
    requestOptions.followRedirects = true;

    // Ajoute les en-têtes d'autorisation si disponibles
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    try {
      var response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
      );

     // print("Response status: ${response.statusCode}"); // Log du statut de la réponse
    // print("Response data: ${response.data}"); // Log des données de la réponse
      return response.data;
    } catch (e) {
      print("Dio error: $e");
      rethrow; // Rethrow pour que les erreurs soient gérées ailleurs
    }
  }

  Future<Response<dynamic>> retryRequest(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  bool shouldRetry(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.receiveTimeout;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      print("Connection timed out.");
      return ErrorEntity(code: -1, message: "Connection timed out");
    case DioExceptionType.sendTimeout:
      print("Send timeout.");
      return ErrorEntity(code: -1, message: "Send timed out");
    case DioExceptionType.receiveTimeout:
      print("Receive timeout.");
      return ErrorEntity(code: -1, message: "Receive timed out");
    case DioExceptionType.badCertificate:
      print("Bad SSL Certificate.");
      return ErrorEntity(code: -1, message: "Bad SSL Certificate");
    case DioExceptionType.badResponse:
      print("Server bad response.");
      switch (error.response?.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Request syntax error");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");
        case 500:
          return ErrorEntity(code: 500, message: "Internal server error");
        default:
          return ErrorEntity(code: error.response?.statusCode ?? -1, message: "Server error !");
      }
    case DioExceptionType.cancel:
      print("Request cancelled.");
      return ErrorEntity(code: -1, message: "Request cancelled");
    case DioExceptionType.connectionError:
      print("Connection error.");
      return ErrorEntity(code: -1, message: "Connection error");
    case DioExceptionType.unknown:
      print("Unknown error.");
      return ErrorEntity(code: -1, message: "Unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  print("Error code: ${eInfo.code}, message: ${eInfo.message}");

  switch (eInfo.code) {
    case 400:
      print("Server syntax error.");
      break;
    case 401:
      print("Access denied.");
      break;
    case 500:
      print("Internal server error.");
      break;
    default:
      print("Unknown error.");
      break;
  }
}
