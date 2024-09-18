import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/custom_text_field.dart';
import 'package:hostel_management_system/common/spacing.dart';
import 'package:hostel_management_system/features/auth/widgets/custom_button.dart';
import 'package:hostel_management_system/home/screen/home_screen.dart';
import 'package:hostel_management_system/theme/colors.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String? selectedBlock;
  String? selectedRoom;

  List<String> blockOptions = ['A', 'B'];
  List<String> roomOptionsA = ['101', '102', '103'];
  List<String> roomOptionsB = ['201', '202', '203'];

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpacer(40),
                  Center(
                    child: Image.asset(
                      AppConstants.logo,
                      height: 150.h,
                      width: 150.w,
                    ),
                  ),
                  heightSpacer(30),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Register your account",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff333333),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  heightSpacer(25),
                  Text(
                    "Username",
                    style: AppTextTheme.kLabelStyle,
                  ),
                  CustomTextField(
                    controller: username,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xffd1d8ff),
                      ),
                    ),
                    inputHint: "Enter your Username",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  heightSpacer(15),
                  Text(
                    "First Name",
                    style: AppTextTheme.kLabelStyle,
                  ),
                  CustomTextField(
                    controller: firstName,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xffd1d8ff),
                      ),
                    ),
                    inputHint: "Enter your First Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'First Name is required';
                      }
                      return null;
                    },
                  ),
                  heightSpacer(15),
                  Text(
                    "Last Name",
                    style: AppTextTheme.kLabelStyle,
                  ),
                  CustomTextField(
                    controller: lastName,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xffd1d8ff),
                      ),
                    ),
                    inputHint: "Enter your Last Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Last Name is required';
                      }
                      return null;
                    },
                  ),
                  heightSpacer(15),
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
                    obscureText: true,
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
                  heightSpacer(15),
                  Text(
                    "Phone Number",
                    style: AppTextTheme.kLabelStyle,
                  ),
                  CustomTextField(
                    controller: phoneNumber,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(
                        color: Color(0xffd1d8ff),
                      ),
                    ),
                    inputHint: "Enter your Phone Number",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Phone Number is required';
                      }
                      return null;
                    },
                  ),
                  heightSpacer(15),
                  Row(
                    children: [
                      Container(
                        height: 50.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(
                                0xff2e8b57,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            widthSpacer(20),
                            const Text("Block No."),
                            widthSpacer(8),
                            DropdownButton(
                              value: selectedBlock,
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    selectedBlock = newValue;
                                    selectedRoom = null;
                                  },
                                );
                              },
                              items: blockOptions.map(
                                (String block) {
                                  return DropdownMenuItem(
                                      value: block, child: Text(block));
                                },
                              ).toList(),
                            ),
                            widthSpacer(20),
                          ],
                        ),
                      ),
                      widthSpacer(30),
                      Container(
                        height: 50.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              color: Color(
                                0xff2e8b57,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            widthSpacer(20),
                            const Text("Room No."),
                            widthSpacer(8),
                            DropdownButton<String>(
                              value: selectedRoom,
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    selectedRoom = newValue;
                                  },
                                );
                              },
                              items: (selectedBlock == 'A'
                                      ? roomOptionsA
                                      : roomOptionsB)
                                  .map((String room) {
                                return DropdownMenuItem<String>(
                                    value: room, child: Text(room));
                              }).toList(),
                            ),
                            widthSpacer(20),
                          ],
                        ),
                      )
                    ],
                  ),
                  heightSpacer(15),
                  CustomButton(
                    buttonText: 'Register',
                    buttonColor: Colors.white,
                    onTap: () {
                      // print(selectedBlock);
                      // print(selectedRoom);
                      // if (_formkey.currentState!.validate()) {

                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    size: 16,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
