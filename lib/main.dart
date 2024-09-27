import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hostel_management_system/api_services/api_provider.dart';
import 'package:hostel_management_system/api_services/api_utils.dart';
import 'package:hostel_management_system/features/auth/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http; // Import http package correctly

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) =>
            ApiProvider(baseUrl: ApiUtils.baseUrl, httpClient: http.Client()),
      )
    ],
    child: const ScreenUtilInit(
      splitScreenMode: true,
      designSize: Size(375, 825),
      useInheritedMediaQuery: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hostel Management System",
        home: LoginScreen(),
      ),
    ),
  ));
}
