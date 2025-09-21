import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';



Widget searchBar({
  required TextEditingController controller,
  required VoidCallback onSearch,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Champ de recherche
      Expanded(
        child: Container(
          height: 40.h,
          decoration: appBoxShadow(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              const Icon(Icons.search, color: AppColors.primaryFourElementText),
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Search your course ...",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(width: 8),
      // Bouton recherche
      GestureDetector(
        onTap: onSearch,
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: appBoxShadow(
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: const Icon(
            Icons.send_and_archive_rounded,
            color: AppColors.primaryBackground,
          ),
        ),
      ),
    ],
  );
}


