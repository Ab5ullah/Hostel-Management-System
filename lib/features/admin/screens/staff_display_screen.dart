import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/common/app_bar.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/models/staff_info_model.dart';
import 'package:hostel_management_system/theme/text_theme.dart';
import 'package:provider/provider.dart';

import '../../../api_services/api_provider.dart';
import '../../../api_services/api_utils.dart';

class StaffDisplayScreen extends StatefulWidget {
  const StaffDisplayScreen({super.key});

  @override
  State<StaffDisplayScreen> createState() => _StaffDisplayScreenState();
}

class _StaffDisplayScreenState extends State<StaffDisplayScreen> {
  StaffInfoModel? staffInfoModel;

  Future<void> fetchAllStaff() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);

      final staffInfo = await apiProvider.getResponse(ApiUtils.staffInfo);

      if (staffInfo.statusCode == 200) {
        final Map<String, dynamic> staff = json.decode(staffInfo.body);
        staffInfoModel = StaffInfoModel.fromJson(staff);
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
      appBar: buildAppBar(context, "Staffs"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: fetchAllStaff(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return staffInfoModel == null
                  ? const Center(
                      child: Text(
                        "No Availability",
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2 / 1.2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: staffInfoModel!.result.length,
                      itemBuilder: (context, index) {
                        final staff = staffInfoModel!.result[index];
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color(0xff007b38), width: 2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          AppConstants.person,
                                          width: 90.w,
                                          height: 90.h,
                                        ),
                                        heightSpacer(20),
                                        Text(
                                          "Hostel Warden",
                                          style: AppTextTheme.kLabelStyle,
                                        ),
                                      ],
                                    ),
                                    widthSpacer(10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          heightSpacer(10),
                                          Text(
                                            "Name: ${staff.firstName}",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          heightSpacer(8),
                                          Text(
                                            "Email: ${staff.emailId}",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          heightSpacer(8),
                                          Text(
                                            "Contact: ${staff.phoneNumber}",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          heightSpacer(8),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffec6977),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Delete",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
            }
          },
        ),
      ),
    );
  }
}
