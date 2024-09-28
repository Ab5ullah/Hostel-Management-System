import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/common/app_bar.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/models/issue_model.dart';
import 'package:hostel_management_system/theme/text_theme.dart';
import 'package:provider/provider.dart';

import '../../../api_services/api_provider.dart';
import '../../../api_services/api_utils.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key});

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  IssueModel? issueModel;

  Future<void> fetchStudentIssues() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);

      final issueResponse =
          await apiProvider.getResponse(ApiUtils.studentIssues);

      if (issueResponse.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(issueResponse.body);
        issueModel = IssueModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch issues');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Students Issues"),
      body: FutureBuilder(
        future: fetchStudentIssues(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return issueModel == null
                ? const Center(
                    child: Text(
                      "No Availability",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: issueModel!.result.length,
                      itemBuilder: (context, index) {
                        final issue = issueModel!.result[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: IssueCard(issue: issue),
                        );
                      },
                    ),
                  );
          }
        },
      ),
    );
  }
}

class IssueCard extends StatelessWidget {
  final Result issue;
  const IssueCard({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          heightSpacer(20),
          Container(
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0, -1),
                end: const Alignment(0, 1),
                colors: [
                  const Color(0xff2e8b57).withOpacity(0.5),
                  const Color(0x002e8857),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    heightSpacer(20),
                    Image.asset(
                      AppConstants.person,
                      height: 70.h,
                      width: 70.w,
                    ),
                    heightSpacer(10),
                    Text(
                      "Pankaj Pandayy",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                widthSpacer(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpacer(10),
                    Text(
                      "Username: ${issue.studentDetails.userName}",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    heightSpacer(10),
                    Text(
                      "Room Number: ${issue.roomDetails.roomNumber}",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    heightSpacer(10),
                    Text(
                      "Email Id: ${issue.studentEmailId}",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    heightSpacer(10),
                    Text(
                      "Phone Number: ${issue.studentDetails.phoneNumber}",
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    heightSpacer(10),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 150.h,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Issue: ",
                                  style: AppTextTheme.kLabelStyle.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "${issue.issue}",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            heightSpacer(12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Student Comment: ",
                                  style: AppTextTheme.kLabelStyle.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "'${issue.studentComment}'",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            heightSpacer(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    width: 140.w,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Resolved",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
