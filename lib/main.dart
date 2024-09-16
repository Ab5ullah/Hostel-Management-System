import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/features/auth/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ScreenUtilInit(
    splitScreenMode: true,
    designSize: Size(375, 825),
    useInheritedMediaQuery: true,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hostel Management System",
      home: LoginScreen(),
    ),
  ));
}
