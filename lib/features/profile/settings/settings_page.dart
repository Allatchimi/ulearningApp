import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/features/profile/settings/widgets/settings_widgets.dart';
import 'package:ulearning_app/global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void func() {
    Global.storageServices.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
    Global.storageServices.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutesNames.SIGN_IN, (route) => false);

    //Global.storageServices.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    //Global.storageServices.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, false);
    //Global.storageServices.setBool(AppConstants.STORAGE_USER_LOGGED_IN_KEY, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              buildSettingsItem(context: context, func: func),
            ],
          ),
        ),
      ),
    );
  }
}
