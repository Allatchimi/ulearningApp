
class ApiResponse<T> {
  final String status;
  final String message;
  final T? data;
  final dynamic metaData;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
    this.metaData,
  });

  // Factory constructor pour créer une instance à partir du JSON
  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return ApiResponse<T>(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      metaData: json['metaData'],
    );
  }

  // Méthode pour convertir en JSON
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'status': status,
      'message': message,
      'data': data != null ? toJsonT(data as T) : null,
      'metaData': metaData,
    };
  }

  // Méthodes utilitaires
  bool isSuccess() => status == 'success';
  bool isError() => status == 'error';

  @override
  String toString() {
    return 'ApiResponse{status: $status, message: $message, data: $data, metaData: $metaData}';
  }
}