import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/custom_text_field.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/features/auth/screens/register_screen.dart';
import 'package:hostel_management_system/features/auth/widgets/custom_button.dart';
import 'package:hostel_management_system/theme/colors.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  heightSpacer(20),
                  Text(
                    "Email",
                    style: AppTextTheme.kLabelStyle,
                  ),
                  CustomTextField(
                    controller: email,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xffd1d8ff),
                      ),
                    ),
                    inputHint: "Enter your Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  heightSpacer(15),
                  Text(
                    "Password",
                    style: AppTextTheme.kLabelStyle,
                  ),
                  CustomTextField(
                    controller: password,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xffd1d8ff),
                      ),
                    ),
                    inputHint: "Enter your Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  heightSpacer(10),
                  CustomButton(
                    buttonText: "Login",
                    buttonColor: Colors.white,
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        //     print("validated!");
                      }
                    },
                    size: 16,
                  ),
                  heightSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't have an account? "),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Register",
                          style: AppTextTheme.kLabelStyle.copyWith(
                              fontSize: 14.sp, color: AppColors.kGreenColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
