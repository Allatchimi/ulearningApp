import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/course_detail/view/widgets/course_detail_widgets.dart';

class YourCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Courses'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        //padding: const EdgeInsets.all(16.0),
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section principale
              Container(
                height: 180,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner5.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ongoing",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Art & Illustration",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "20/25 Lesson",
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            ),
                        child: const Text("Continue"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              searchBar(),
              // Barre de recherche
              /* TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search your course...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              */
              const SizedBox(height: 16),
              // Liste de cours
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All courses",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  ),
                ],
              ),
              const LessonInfo(),
              /*
              Expanded(
                child:
                 ListView(
                  children: [
                    CourseCard(
                      image: 'assets/visual_identity.jpg',
                      title: 'Visual Identity',
                      lessons: '20/25 Lessons',
                      price: '700',
                    ),
                    CourseCard(
                      image: 'assets/user_interface.jpg',
                      title: 'User Interface',
                      lessons: '40/75 Lessons',
                      price: '1500',
                    ),
                    CourseCard(
                      image: 'assets/marketing.jpg',
                      title: 'Marketing',
                      lessons: '25/39 Lessons',
                      price: '900',
                    ),
                    CourseCard(
                      image: 'assets/packaging_design.jpg',
                      title: 'Packaging Design',
                      lessons: '19/40 Lessons',
                      price: '400',
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String image;
  final String title;
  final String lessons;
  final String price;

  CourseCard({
    required this.image,
    required this.title,
    required this.lessons,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        title: Text(title),
        subtitle: Text(lessons),
        trailing:
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
