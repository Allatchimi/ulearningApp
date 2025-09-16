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
    var lessonData = ref.watch(lessonVideosControllerProvider as ProviderListenable);
    var lessonDetail = ref.watch(LessonVideosControllerProvider(lessonId: args));

    return Scaffold(
      appBar: buildAppBar(text: "Lesson detail"),
      body: Padding(
        padding: EdgeInsets.only(top:10.h,left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lessonData.when(
                  data: (data) =>Container(
                    width: 325.w,
                    height: 200.h,
                    child: FutureBuilder(
                      future: videoPlayerController?.initialize(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return videoPlayerController == null
                              ? Container()
                              : Stack(
                            children: [
                              VideoPlayer(videoPlayerController!),
                            ],
                          );
                        } else {
                          print("erreur de chargement");
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  error: (error, stackTrace) {
                    return const Center(
                      child: Text(
                          "Erreur lors du chargement des données de la leçon"),
                    );
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
                      ),
                      SizedBox(width: 15.h),
                      AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.play,
                      ),
                      SizedBox(width: 15.h),
                      AppImage(
                        width: 25.w,
                        height: 25.h,
                        imagePath: ImageRes.suivant,
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
                      return LessonVideos(lessonVideoData: data,onVideoTap: (p0) {
                        
                      },);
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