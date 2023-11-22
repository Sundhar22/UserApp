import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constant/colors/app_color.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: TabBar(
        controller: _tabController,
        tabAlignment:TabAlignment.start ,
        automaticIndicatorColorAdjustment: true,
        isScrollable: true,
        indicatorColor: AppColor.primaryColor,
        labelColor: AppColor.primaryColor,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
        ),
        tabs: const [
          Tab(
            text: "Upcoming",
          ),
          Tab(
            text: "Past",
          ),
          Tab(
            text: "Cancelled",
          ),
          Tab(
            text: "Pending",
          ),
          Tab(
            text: "Accepted",
          ),
          Tab(
            text: "Rejected",
          ),
          Tab(
            text: "All",
          ),
        ],
      ),
    );
  }
}
