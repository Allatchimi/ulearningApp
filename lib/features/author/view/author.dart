import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/author/view/widgets/athor_widgets.dart';
import 'package:ulearning_app/features/course_detail/controller/course_controller.dart';

class AuthorScreen extends ConsumerStatefulWidget {
  const AuthorScreen({super.key});

  @override
  ConsumerState<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends ConsumerState<AuthorScreen> {

  late String teacherName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    teacherName = args["teacherName"];
  }

  @override
  Widget build(BuildContext context) {
  
    final coursesAsync = ref.watch(teacherCoursesControllerProvider(username: teacherName));

    return Scaffold(
      appBar: buildAppBar(text: "Contributeur"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            children: [
              AuthorThumbnail(),
              AuthorConText(),
              SizedBox(height: 20.h),
              AuthorAboutMe(),
              SizedBox(height: 20.h),
              AuthorCourseListTitle(),
              SizedBox(height: 20.h),
              AuthorCourseList(coursesAsync: coursesAsync),
              //AuthorGoBuyButton(),
              
            ],
          ),
        ),
      ),

    );
  }
}
