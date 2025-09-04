import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Container(
        child: Text("Settings"),
      ),
    ),
  );
}

Widget buildSettingsItem({
  required BuildContext context,
  required VoidCallback func,
}) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Logout"),
              content: Text("Confirm Logout"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: func,
                  child: Text("Confirm"),
                )
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/icons/log-out.png"))),
    ),
  );
}
