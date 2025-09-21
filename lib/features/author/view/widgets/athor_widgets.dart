import 'package:faker/faker.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

class AuthorThumbnail extends StatelessWidget {
  final User? user;
  const AuthorThumbnail({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return /* AppBoxDecoratioonImage(
        imagePath: "${AppConstants.SERVER_API_URL}${user?.profileImageUrl!}",
        width: 325.w,
        height: 150.h,
        fit: BoxFit.cover); */
        Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 200,
        width: 325.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('assets/images/banner5.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: -40, // pour la faire descendre sous la bannière
        left: 40,
        child: Container(
          height: 80, // 👈 plus grand pour ressembler à un avatar
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.primary_bg, // couleur de fond si pas d’image
            borderRadius: BorderRadius.circular(12), // 👈 coins arrondis (optionnel)
            image: DecorationImage(
              image: AssetImage(ImageRes.profile),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]);
  }
}

class AuthorConText extends StatelessWidget {
  final User? courseItem;
  const AuthorConText({super.key, this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, left: 120.w),
      width: 325.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text13Normal(
            text: "Author Page",
            color: AppColors.primaryText,
            fontWeight: FontWeight.w900,
          ),
          const Text10Normal(
            text: "Developpeur web",
            color: AppColors.primaryThreeElementText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Row(
                children: [
                  AppImage(
                    imagePath: ImageRes.profile,
                  ),
                  SizedBox(width: 6.w),
                  Text11Normal(
                    text: "12",
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10.h),
                child: Row(
                  children: [
                    AppImage(
                      imagePath: ImageRes.play,
                    ),
                    SizedBox(width: 6.w),
                    Text11Normal(
                      text: "les dev",
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.h),
                child: Row(
                  children: [
                    AppImage(
                      imagePath: ImageRes.home
                    ),
                    SizedBox(width: 6.w),
                    Text11Normal(
                      text: "les dev",
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AuthorAboutMe extends StatelessWidget {

  const AuthorAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text16Normal(
          text: "About Me ",
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        Text11Normal(
          textAlign: TextAlign.start,
          text: faker.lorem.sentences(10).toString(),
          //text: courseItem.description ?? "No Description",
          color: AppColors.primaryThreeElementText,
        ),
      ],
    );
  }
}

class AuthorCourseListTitle extends StatelessWidget {

  const AuthorCourseListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text16Normal(
          text: "My Course List",
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

class AuthorGoBuyButton extends StatelessWidget {
  const AuthorGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: const AppButton(buttonName: "Go Buy"));
  }
}

class AuthorCourseList extends ConsumerWidget {
  final AsyncValue<List<CourseItem>> coursesAsync;

  const AuthorCourseList({super.key, required this.coursesAsync});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return coursesAsync.when(
      data: (courses) {
        if (courses.isEmpty) {
          return const Center(
              child: Text("Cet enseignant n’a aucun cours disponible."));
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: courses.length,
          itemBuilder: (_, index) {
            final course = courses[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  "/course_detail",
                  arguments: {"id": course.id},
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.primarySecondaryBackground,
                      blurRadius: 2,
                      offset: Offset(0,2),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "${AppConstants.SERVER_API_URL}${course.thumbnail}",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(course.name ?? "Sans titre",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          Text(course.description ?? "Pas de description",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    //const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text("Erreur : $err")),
    );
  }
}

