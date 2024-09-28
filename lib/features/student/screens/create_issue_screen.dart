import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/api_services/api_calls.dart';
import 'package:hostel_management_system/api_services/api_utils.dart';
import 'package:hostel_management_system/common/app_bar.dart';
import 'package:hostel_management_system/features/auth/widgets/custom_text_field.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/features/auth/widgets/custom_button.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

class StudentCreateIssueScreen extends StatefulWidget {
  const StudentCreateIssueScreen({super.key});

  @override
  State<StudentCreateIssueScreen> createState() => _CreateIssueScreenState();
}

class _CreateIssueScreenState extends State<StudentCreateIssueScreen> {
  TextEditingController studentComment = TextEditingController();
  ApiCalls apiCalls = ApiCalls();
  String? selectedIssue;
  List<String> issues = [
    "Bathroom",
    "Bedroom",
    "Water",
    "Furniturem",
    "Kitchen",
  ];
  @override
  void dispose() {
    super.dispose();
    studentComment.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Create Issue"),
      body: SingleChildScrollView(
        child: Padding(
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
                heightSpacer(15),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      ApiUtils.roomNumber,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ),
                heightSpacer(15),
                Text(
                  "Block Number",
                  style: AppTextTheme.kLabelStyle,
                ),
                heightSpacer(15),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      ApiUtils.blockNumber,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ),
                heightSpacer(15),
                Text(
                  "Your Email Id",
                  style: AppTextTheme.kLabelStyle,
                ),
                heightSpacer(15),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      ApiUtils.email,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ),
                heightSpacer(15),
                Text(
                  "Phone Number",
                  style: AppTextTheme.kLabelStyle,
                ),
                heightSpacer(15),
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      ApiUtils.phoneNumber,
                      style: TextStyle(
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ),
                heightSpacer(15),
                Text(
                  "Issue you are facing",
                  style: AppTextTheme.kLabelStyle,
                ),
                heightSpacer(15),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
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
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      value: selectedIssue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedIssue = newValue;
                        });
                      },
                      items: issues.map(
                        (String issue) {
                          return DropdownMenuItem(
                            value: issue,
                            child: Text(issue),
                          );
                        },
                      ).toList()),
                ),
                heightSpacer(15),
                Text(
                  "Comment",
                  style: AppTextTheme.kLabelStyle,
                ),
                heightSpacer(15),
                CustomTextField(
                  controller: studentComment,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Comment is required";
                    }
                    return null;
                  },
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: Color(0xffd1d8ff),
                    ),
                  ),
                ),
                heightSpacer(40),
                CustomButton(
                  buttonText: "Submit",
                  onTap: () async {
                    await apiCalls.createAnIssue(
                      context,
                      ApiUtils.roomNumber,
                      ApiUtils.blockNumber,
                      ApiUtils.email,
                      selectedIssue ?? "",
                      ApiUtils.phoneNumber,
                      studentComment.text,
                    );
                  },
                ),
                heightSpacer(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
