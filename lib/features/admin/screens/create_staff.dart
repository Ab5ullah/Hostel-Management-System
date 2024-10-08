import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/api_services/api_calls.dart';
import 'package:hostel_management_system/common/app_bar.dart';
import 'package:hostel_management_system/features/auth/widgets/custom_button.dart';
import 'package:hostel_management_system/theme/text_theme.dart';

import '../../../api_services/api_utils.dart';
import '../../auth/widgets/custom_text_field.dart';
import '../../../common/spacing.dart';

class CreateStaffScreen extends StatefulWidget {
  const CreateStaffScreen({super.key});

  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  static final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController jobRole = TextEditingController();
  ApiCalls apiCalls = ApiCalls();
  final emailRegex = RegExp(r'^[\w-]+(.[\w-]+)@[\w-]+(.[\w-]+)(.[a-z]{2,})$');

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    firstName.dispose();
    lastName.dispose();
    phoneNumber.dispose();
    jobRole.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Create Staff'),
      body: ApiUtils.roleId != 1
          ? const Center(
              child: Text("you dont have permission to view this page"),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 15.w,
                ),
                child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          "Job Role",
                          style: AppTextTheme.kLabelStyle,
                        ),
                        CustomTextField(
                          controller: jobRole,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xffd1d8ff),
                            ),
                          ),
                          inputHint: "Enter your Job Role",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Job Role is required';
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
                            } else if (!emailRegex.hasMatch(value)) {
                              return 'Email is invalid';
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
                        CustomButton(
                            buttonText: "Create Staff",
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                apiCalls.createStaff(
                                  context,
                                  username.text,
                                  firstName.text,
                                  lastName.text,
                                  email.text,
                                  password.text,
                                  phoneNumber.text,
                                  jobRole.text,
                                );
                              }
                            })
                      ],
                    )),
              ),
            ),
    );
  }
}
