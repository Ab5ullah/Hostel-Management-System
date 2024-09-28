import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hostel_management_system/api_services/api_utils.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/features/auth/screens/login_screen.dart';
import 'package:hostel_management_system/features/auth/widgets/custom_button.dart';
import 'package:hostel_management_system/features/auth/widgets/custom_text_field.dart';
import 'package:hostel_management_system/theme/colors.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppTextTheme.kLabelStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.kGreenColor,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: ApiUtils.roleId == 1
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppConstants.profile,
                    height: 180.h,
                    width: 180.w,
                  ),
                ),
                heightSpacer(10),
                Text(
                  "You're an Admin",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppConstants.profile,
                      height: 180.h,
                      width: 180.w,
                    ),
                    heightSpacer(10),
                    Text(
                      "${ApiUtils.firstName} ${ApiUtils.lastName}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                    ),
                    heightSpacer(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
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
                                "Room No - ${ApiUtils.roomNumber}",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        widthSpacer(30),
                        Expanded(
                          child: Container(
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
                                "Block No - ${ApiUtils.blockNumber}",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(20),
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
                    heightSpacer(20),
                    CustomTextField(
                      controller: username,
                      inputHint: ApiUtils.username,
                      prefixIcon: const Icon(Icons.person_2_outlined),
                    ),
                    heightSpacer(20),
                    CustomTextField(
                      controller: phoneNumber,
                      inputHint: ApiUtils.phoneNumber,
                      prefixIcon: const Icon(Icons.phone_outlined),
                    ),
                    heightSpacer(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: firstName,
                            inputHint: ApiUtils.firstName,
                          ),
                        ),
                        widthSpacer(20),
                        Expanded(
                          child: CustomTextField(
                            controller: lastName,
                            inputHint: ApiUtils.lastName,
                          ),
                        ),
                      ],
                    ),
                    heightSpacer(30),
                    CustomButton(buttonText: "Save", onTap: () {})
                  ],
                ),
              ),
            ),
    );
  }
}
