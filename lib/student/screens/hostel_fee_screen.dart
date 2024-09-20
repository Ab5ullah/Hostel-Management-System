import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hostel_management_system/common/app_bar.dart';
import 'package:hostel_management_system/common/constant.dart';
import 'package:hostel_management_system/common/spacing.dart';

class HostelFeeScreen extends StatefulWidget {
  const HostelFeeScreen({super.key});

  @override
  State<HostelFeeScreen> createState() => _HostelFeeScreenState();
}

class _HostelFeeScreenState extends State<HostelFeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Hostel Fee"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          heightSpacer(20),
          SvgPicture.asset(
            AppConstants.hostel,
          ),
          heightSpacer(40),
          Container(
            width: double.maxFinite,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  width: 4,
                  color: Color(0xff2e8857),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpacer(20),
                  Text(
                    "Hostel Details",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  heightSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Block No : ",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "B",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Room No : ",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "101",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  heightSpacer(20),
                  Text(
                    "Payment Details",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  heightSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Maintainance Charge : ",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "\$0000",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  heightSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking Charge : ",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "\$0000",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  heightSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Room Water Charge : ",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "\$0000",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  heightSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Room Charge : ",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "\$0000",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  heightSpacer(20),
                  Divider(
                    color: Colors.black,
                  ),
                  heightSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount : ",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "\$0000",
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  heightSpacer(20),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
