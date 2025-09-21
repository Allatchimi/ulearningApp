import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/course_detail/controller/course_controller.dart';
import 'package:ulearning_app/features/course_detail/view/widgets/course_detail_widgets.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;
  //late Map args;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final courseData =
        ref.watch(courseDetailControllerProvider(index: args.toInt()));
    var lessonData =
        ref.watch(courseLessonListControllerProvider(index: args.toInt()));

    return Scaffold(
      appBar: buildGlobalAppBar(text: "Course detail"),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              courseData.when(
                data: (data) {
                  // Use 'data' safely, as it can be null.
                  return data == null
                      ? const SizedBox() // Show empty space if data is null
                      : Column(
                          children: [
                            CourseDetailThumbnail(courseItem: data),
                            CourseDetailIconText(courseItem: data),
                            const SizedBox(height: 10,),
                            CourseDetailDescription(courseItem: data),
                            const SizedBox(height: 20,),
                            const CourseDetailGoBuyButton(),
                            const SizedBox(height: 20,),
                            CourseDetailIncludes(courseItem: data),
                            const SizedBox(height: 20,),
                          ],
                        );
                },
                error: (error, stackTrace) {
                  // Display an error message
                  return const Center(child: Text("Error loading the course data"));
                },
                loading: () {
                  // Show a loading indicator
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              lessonData.when(
                data: (data) => data == null ? const SizedBox(
                  child: Center(child: Text("Ce Cour n a pas de Lesson encore")),
                    
                )
                :LessonInfo(lessonData: data,ref:ref),
                error: (error, stackTrace) {
                  // Display an error message
                  return const Center(child: Text("Error loading the  lesson  data"));
                },
                loading: () {
                  // Show a loading indicator
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
