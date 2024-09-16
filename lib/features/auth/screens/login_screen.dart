import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/custom_text_field.dart';
import 'package:hostel_management_system/common/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppConstants.logo,
              height: 250.h,
            ),
          ),
          heightSpacer(30),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Login to Your Account",
              style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xff333333),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          heightSpacer(25),
          const CustomTextField()
        ],
      )),
    );
  }
}
