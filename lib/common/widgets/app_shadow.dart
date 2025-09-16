import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entities.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../utils/image_res.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
  // BorderRadius? borderRadius,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.h),
        topRight: Radius.circular(20.h),
      ),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxDecorationTextField(
    {Color color = AppColors.primaryBackground,
    double radius = 15,
    Color borderColor = AppColors.primaryFourElementText}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor));
}

/*
class AppBoxDecoratioonImage extends StatelessWidget {
  final  double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  const AppBoxDecoratioonImage({
    super.key,
    this.width= 40,this.height = 40, this.imagePath =ImageRes.profile, this.fit = BoxFit.fitHeight
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: fit,
            image: AssetImage(
              imagePath,
            ),
          ),
          borderRadius: BorderRadius.circular(20.w)),
    );
  }
}*/
class AppBoxDecoratioonImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;
  final Function()? func;
  // final ImageProvider? imageProvider;

  const AppBoxDecoratioonImage({
    super.key,
    this.width = 40,
    this.height = 40,
    this.imagePath = ImageRes.defaultImage,
    this.courseItem,
    // this.imageProvider,
    this.func, // Chemin par défaut
    this.fit = BoxFit.fitHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: _isUrl(imagePath)
                  ? NetworkImage(imagePath)
                  : AssetImage(imagePath)
              // Utiliser NetworkImage pour les URL//: AssetImage(imagePath)//as ImageProvider, // Utiliser AssetImage pour les chemins locaux
              // image: FileImage(File(imagePath)),
              // image: imageProvider ?? AssetImage(ImageRes.defaultImage),
              ),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: courseItem == null
            ? Container()
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.w),
                    child: FadeText(
                      text: courseItem!.name!,
                      color: AppColors.primaryBackground,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
                    child: FadeText(
                      text: "${courseItem!.lessonNum} Lessons",
                      color: AppColors.primaryBackground,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // Fonction pour vérifier si une chaîne est une URL
  bool _isUrl(String path) {
    return Uri.tryParse(path)?.hasScheme ?? false;
  }
}
