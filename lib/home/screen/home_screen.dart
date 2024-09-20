import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/features/admin/screens/create_staff.dart';
import 'package:hostel_management_system/features/admin/screens/room_change_request_screen.dart';
import 'package:hostel_management_system/features/admin/screens/staff_display_screen.dart';
import 'package:hostel_management_system/features/auth/widgets/category_card.dart';
import 'package:hostel_management_system/student/screens/create_issue_screen.dart';
import 'package:hostel_management_system/student/screens/hostel_fee_screen.dart';
import 'package:hostel_management_system/student/screens/issue_screen.dart';
import 'package:hostel_management_system/student/screens/room_availability.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(AppConstants.profile),
            ),
          ),
        ],
        title: Text(
          "Dashboard",
          style: AppTextTheme.kLabelStyle.copyWith(fontSize: 22.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            heightSpacer(20),
            Container(
              height: 140.h,
              width: double.maxFinite,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Color(0xff007b3b),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(2),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x332e8b57),
                    blurRadius: 8,
                    offset: Offset(2, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ndjasdsa",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff333333),
                            fontSize: 24.sp,
                          ),
                        ),
                        heightSpacer(15),
                        Text(
                          "Room No. 101",
                          style: TextStyle(
                            color: const Color(0xff333333),
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          "Block No. A",
                          style: TextStyle(
                            color: const Color(0xff333333),
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    widthSpacer(10),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentCreateIssueScreen(),
                                ),
                              );
                            },
                            child: SvgPicture.asset(AppConstants.createIssue)),
                        Text(
                          "Create Issue",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            heightSpacer(30),
            Container(
              width: double.maxFinite,
              color: const Color(0x262E8B57),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpacer(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff333333),
                        fontSize: 19.sp,
                      ),
                    ),
                  ),
                  heightSpacer(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryCard(
                        category: "Room\n Availability",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RoomAvailabilityScreen(),
                            ),
                          );
                        },
                        image: AppConstants.roomAvailability,
                      ),
                      CategoryCard(
                        category: "All\n Issues",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IssueScreen(),
                            ),
                          );
                        },
                        image: AppConstants.allIssues,
                      ),
                      CategoryCard(
                        category: "Staff\n Members",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StaffDisplayScreen(),
                            ),
                          );
                        },
                        image: AppConstants.staffMember,
                      ),
                    ],
                  ),
                  heightSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryCard(
                        category: "Create\n Staff",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateStaffScreen(),
                            ),
                          );
                        },
                        image: AppConstants.createStaff,
                      ),
                      CategoryCard(
                        category: "Hostel\n Fee",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HostelFeeScreen(),
                            ),
                          );
                        },
                        image: AppConstants.hostelFee,
                      ),
                      CategoryCard(
                        category: "Change\n Requests",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RoomChangeRequestScreen(),
                            ),
                          );
                        },
                        image: AppConstants.roomChange,
                      ),
                    ],
                  ),
                  heightSpacer(20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
