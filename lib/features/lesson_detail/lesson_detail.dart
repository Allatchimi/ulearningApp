import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import 'package:ulearning_app/features/lesson_detail/controller/lesson_controller.dart';
import 'package:ulearning_app/features/lesson_detail/view/widgets/lesson_detail_widgets.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late int args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var id = ModalRoute.of(context)?.settings.arguments as Map?;
    args = id?["id"] ?? 0; // Default to 0 if `id` is null

  }

  @override
  Widget build(BuildContext context) {
    //var lessonData = ref.watch(courseLessonListControllerProvider(index: args));
    var lessonData = ref.watch(courseLessonDetailControllerProvider(index: args));
    return Scaffold(
      appBar: buildAppBar(text: "Lesson detail"),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              lessonData.when(
                data: (data) {
                  if (data == null || data.isEmpty) {
                    // Display a message if no lessons are available
                    return const Center(
                      child: Text("Ce Lessons n'a pas de chapitre encore"),
                    );
                  }
                  int index = 0; // Modify this index as needed
                  // Check to prevent RangeError and handle nullable `name`
                  return Column(
                    children: [
                      SizedBox(height: 10.h),
                      Text16Normal(
                        text: (data.length > index && data[index].name != null)
                            ? data[index].name!
                            : 'Nom indisponible',
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10.h),
                      AppBoxDecoratioonImage(
                        width: 325.w,
                        height: 160.h,
                        imagePath: (data.length > index)
                            ? data[index].thumbnail ?? ''
                            : '',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 25.w, left: 25.w, top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawGestureDetector(
                              child: AppImage(
                                width: 25.w,
                                height: 25.h,
                                imagePath: ImageRes.play,
                              ),
                            ),
                            SizedBox(width: 15.h),
                            RawGestureDetector(
                              child: AppImage(
                                width: 25.w,
                                height: 25.h,
                                imagePath: ImageRes.play,
                              ),
                            ),
                            SizedBox(width: 15.h),
                            RawGestureDetector(
                              child: AppImage(
                                width: 25.w,
                                height: 25.h,
                                imagePath: ImageRes.play,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) {
                  // Display an error message
                  return const Center(
                    child: Text(
                        "Erreur lors du chargement des données de la leçon"),
                  );
                },
                loading: () {
                  // Show a loading indicator
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              lessonData.when(
                data: (data) {
                  // Use 'data' safely, as it can be null.
                  if (data == null) {
                    return const SizedBox(
                      child: Center(child: Text("Ce Lesson n a pas de Video encore")),
                    );
                  } else {
                    return LessonVideos(lessonVideoData: data);

                  }
                },
                error: (error, stackTrace) {
                  // Display an error message
                  return const Center(child: Text("Error loading the  lesson  data"));
                },
                loading: () {
                  // Show a loading indicator
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
