import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'http_util.dart';

class AuthImage extends StatefulWidget {
  final String url;
  const AuthImage({super.key, required this.url});

  @override
  State<AuthImage> createState() => _AuthImageState();
}

class _AuthImageState extends State<AuthImage> {
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      final dio = HttpUtil().dio;
      final response = await dio.get<List<int>>(
        widget.url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: HttpUtil().getAuthorizationHeader(), // 🔥 Ajoute ton token
        ),
      );
      setState(() {
        imageBytes = Uint8List.fromList(response.data!);
      });
    } catch (e) {
      debugPrint("Erreur chargement image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (imageBytes == null) {
      return const Icon(Icons.image_not_supported);
    }
    return Image.memory(imageBytes!, fit: BoxFit.cover);
  }
}
