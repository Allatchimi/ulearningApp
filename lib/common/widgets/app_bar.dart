import 'package:flutter/material.dart';

import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

/* preferredSize  widget gives  you a height or space the appbar downword and and
 we can put  child in the given spaces
*/

AppBar buildAppBar({String text =""}) {
  return AppBar(
    //backgroundColor: Colors.blue ,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.withOpacity(0.3),
            height: 1,
          )),
      title: Text16Normal(
        text: text,
        color: AppColors.primaryText,
      ));
}

AppBar buildGlobalAppBar({String text =""}) {
  return AppBar(

      title: Text16Normal(
        text: text,
        color: AppColors.primaryText,
      ));
}