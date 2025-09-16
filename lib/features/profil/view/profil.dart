import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner4.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 70.w,
                    height: 80.h,
                    decoration:  BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage('assets/images/banner3.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(20.w)
                       ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Robert Nicklas",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("UI Designer"),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text("5.0"),
                          SizedBox(width: 8),
                          Icon(Icons.person, size: 16),
                          Text("213"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "I'm a professional web designer & mobile app designer. I have been working for over 4 years...",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "My Course List",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                //  LessonInfo(),
                  /*ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CourseListItem(
                          title: "What is User Interface Design?",
                          duration: "27 min",
                          image: ImageRes.banner1,
                        ),
                        CourseListItem(
                          title: "What exactly does a UI designer do?",
                          duration: "32 min",
                          image: ImageRes.banner1,
                        ),
                        CourseListItem(
                          title: "Why I became a UI designer?",
                          duration: "25 min",
                          image: ImageRes.banner1,
                        ),
                      ],
                    ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseListItem extends StatelessWidget {
  final String title;
  final String duration;
  final String image;

  const CourseListItem(
      {super.key,
      required this.title,
      required this.duration,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(duration),
      ),
    );
  }
}
