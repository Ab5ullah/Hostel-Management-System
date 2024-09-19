import 'package:flutter/material.dart';
import 'package:hostel_management_system/common/app_bar.dart';
import 'package:hostel_management_system/common/spacing.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key});

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Students Issues"),
      body: ListView.builder(itemBuilder: (context, index) {
        return const IssueCard();
      }),
    );
  }
}

class IssueCard extends StatelessWidget {
  const IssueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          heightSpacer(20),
          Container(
              //     decoration: BoxDecoration,
              )
        ],
      ),
    );
  }
}
