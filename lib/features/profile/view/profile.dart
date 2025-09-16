import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/features/profile/view/widgets/profile_widgets.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              profileIconsAndEditBottom(),
              SizedBox(height: 10.h),
              Text(
                "Flutter Lover",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 20.h),
              buildList(context),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}