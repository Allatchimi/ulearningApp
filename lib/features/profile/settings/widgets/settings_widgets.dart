import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40.w,
           width: 40.w,
          decoration: BoxDecoration(
            //color: AppColors.primaryElementBg,
              image:
                  DecorationImage(
                    image: AssetImage("assets/icons/log-out.png"),
                    fit: BoxFit.contain,
                  ),
                
            ),
        ),
        SizedBox(width: 10,),
        Text("Log out", style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent)
        ),
      ],
    ),
  );
}


/// Widget pour un item de la section (ligne cliquable)
class SettingsItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon, size: 20) : null,
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}

/// Widget pour une section avec titre et liste d’items
class SettingsSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<SettingsItem> items;

  const SettingsSection({
    super.key,
    required this.icon,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: e,
            )),
        const SizedBox(height: 20),
      ],
    );
  }
}

