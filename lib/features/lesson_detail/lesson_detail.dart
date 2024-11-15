import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/lesson_detail/controller/lesson_controller.dart';
import 'package:ulearning_app/features/lesson_detail/view/widgets/lesson_detail_widgets.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late int args;
  VideoPlayerController? videoPlayerController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var id = ModalRoute.of(context)?.settings.arguments as Map?;
    args = id?["id"] ?? 0; // Default to 0 if `id` is null
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lessonData = ref.watch(lessonDataControllerProvider);
    var lessonDetail = ref.watch(LessonDetailControllerProvider(index: args));

    return Scaffold(
      appBar: buildAppBar(text: "Lesson detail"),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lessonData.when(
                  data: (data) {
                    // Vérifiez si le contrôleur de vidéo est initialisé
                    if (data.initializeVideoPlayer == null) {
                      return const Center(child: Text("Le lecteur vidéo n'est pas initialisé"));
                    }

                    // Utilisez FutureBuilder avec un Future<VideoPlayerController>
                    return Container(
                      width: 325.w,
                      height: 200.h,
                      child: FutureBuilder<VideoPlayerController>(
                        future: Future.value(data.initializeVideoPlayer!), // Wrap it in a Future
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Center(child: Text("Erreur lors de l'initialisation de la vidéo"));
                            }

                            // Si la vidéo est initialisée, affichez le lecteur vidéo
                            VideoPlayerController controller = snapshot.data!;
                            // Lire la vidéo automatiquement après l'initialisation
                            if (!controller.value.isPlaying) {
                              controller.play(); // Démarrer la lecture de la vidéo
                            }

                            return VideoPlayer(controller);
                          } else {
                            // Pendant l'initialisation, montrez un indicateur de chargement
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return const Center(child: Text("Erreur lors du chargement des données"));
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.precedant,
                       // onTap: () {
                          // Handle previous video logic},
                      ),
                      SizedBox(width: 15.h),
                      AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.play,
                       /* onTap: () {
                          if (videoPlayerController != null) {
                            if (videoPlayerController!.value.isPlaying) {
                              videoPlayerController!.pause();
                            } else {
                              videoPlayerController!.play();
                            }
                          }
                        },*/
                      ),
                      SizedBox(width: 15.h),
                      AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.suivant,
                       // onTap: () {
                          // Handle next video logic},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                // Integration of video list
                lessonDetail.when(
                  data: (data) {
                    if (data == null) {
                      return const SizedBox(
                        child: Center(
                            child: Text("Ce Lesson n'a pas de Video encore")),
                      );
                    } else {
                      return LessonVideos(lessonVideoData: data);
                    }
                  },
                  error: (error, stackTrace) {
                    return const Center(
                      child: Text("Error loading the lesson data"),
                    );
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}