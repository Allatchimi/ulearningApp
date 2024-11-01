import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/features/course_detail/view/widgets/course_detail_widgets.dart';


class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});


  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
 // late var args;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
   // args =  ModalRoute.of(context)!.settings.arguments as Map;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: "Course detail"),
      body:  Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: const SingleChildScrollView(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             //const SizedBox(),
              CourseDetailThumbnail(),
              CourseDetailIconText(),
              CourseDetailDescription(),
              CourseDetailGoBuyButton(),
              CourseDetailIncludes(),
              LessonInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
