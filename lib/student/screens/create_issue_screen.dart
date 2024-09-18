import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/common/app_bar.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

class StudentCreateIssueScreen extends StatefulWidget {
  const StudentCreateIssueScreen({super.key});

  @override
  State<StudentCreateIssueScreen> createState() => _CreateIssueScreenState();
}

class _CreateIssueScreenState extends State<StudentCreateIssueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Create Issue"),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpacer(15),
              Text(
                "Room Number",
                style: AppTextTheme.kLabelStyle,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.maxFinite,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xff2e8b57),
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("201"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
