import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

import '../theme/colors.dart';

AppBar buildAppBar(BuildContext context, String? title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.kGreenColor,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    title: Text(
      title ?? "Registration",
      style: AppTextTheme.kLabelStyle.copyWith(
          fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
