import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/lesson_detail/repo/lesson_repo.dart';
import 'package:video_player/video_player.dart';

part 'lesson_controller.g.dart';

// Define a nullable VideoPlayerController at the top level
VideoPlayerController? videoPlayerController;

@riverpod
Future<List<LessonVideoItem>?> lessonDetailController(
    LessonDetailControllerRef ref, {
      required int index,
    }) async {
  final response = await LessonRepo.LessonDetail(id: index);

  if (response != null && response.isNotEmpty) {
    String url = response.first.url ?? ''; // Assuming URL is the local file path

    if (url.isNotEmpty) {
      if (videoPlayerController != null) {
        await videoPlayerController!.dispose();
      }

      final file = File(url);
      if (file.existsSync()) {
        // Initialize VideoPlayerController with the local file
        videoPlayerController = VideoPlayerController.file(file);

        try {
          await videoPlayerController!.initialize();
        } catch (e) {
          print("Erreur d'initialisation de la vidéo: $e");
          return null;
        }

        // Create LessonVideo instance with the initialized controller
        LessonVideo videoInstance = LessonVideo(
          lessonItem: response,
          isPlay: true,
          initializeVideoPlayer: videoPlayerController,
          url: url,
        );

        // Update lesson data with the new video instance
        ref.read(lessonDataControllerProvider.notifier).updateLessonData(videoInstance);
        return response;
      } else {
        print("Le fichier vidéo n'existe pas à l'emplacement : $url");
      }
    } else {
      print("Erreur: L'URL est vide pour l'ID de la vidéo: $index");
    }
  } else {
    print("Échec de la requête: la réponse est nulle ou vide pour l'ID de la vidéo: $index");
  }
  return null;
}
@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  // Method to update lesson video data
  void updateLessonData(LessonVideo lessonVideo) {
    update((data) => data.copyWith(
      url: lessonVideo.url,
      lessonItem: lessonVideo.lessonItem,
      initializeVideoPlayer: lessonVideo.initializeVideoPlayer,
    ));
  }
}