import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/course_detail/view/widgets/course_detail_widgets.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        //padding: const EdgeInsets.all(16.0),
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner5.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            const CourseDetailIconText(),
            const SizedBox(height: 40),
            const Text(
              "User Interface",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text10Normal(text: "Image provider Image bundle AssetBundleImageKey bundle PlatformAssetBundle#3056 Asset Image bundle AssetBundleImageKey bundle PlatformAssetBundle#3056e Image bundle AssetBundleImageKey bundle PlatformAssetBundle#3056", textAlign: TextAlign.start),
            const SizedBox(height: 20),
            const Text(
              "The Course Includes",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.video_library),
                SizedBox(width: 8),
                Text("20 Hours Video"),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.library_books),
                SizedBox(width: 8),
                Text("60+ Lessons"),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.download),
                SizedBox(width: 8),
                Text("67 Download Resources"),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "Student Study",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/images/banner1.jpg')),
                SizedBox(width: 8),
                CircleAvatar(backgroundImage: AssetImage('assets/images/banner2.jpg')),
                SizedBox(width: 8),
                CircleAvatar(backgroundImage: AssetImage('assets/images/banner3.jpg')),
                SizedBox(width: 8),
                CircleAvatar(backgroundImage: AssetImage('assets/images/banner3.jpg')),
                SizedBox(width: 8),
                CircleAvatar(backgroundImage: AssetImage('assets/images/banner3.jpg')),
                SizedBox(width: 8),
                CircleAvatar(backgroundImage: AssetImage('assets/images/banner3.jpg')),
                SizedBox(width: 8),
                CircleAvatar(backgroundImage: AssetImage('assets/images/banner3.jpg')),
                // Add more students as needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
