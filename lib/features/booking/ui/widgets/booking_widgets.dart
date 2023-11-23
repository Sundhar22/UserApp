import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/ui/widgets/home_widgets.dart';
import '../../../widgets/notification/ui/notification_page.dart';
import 'tab_widget.dart';

AppBar bookingAppBar(TabController tabController, BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    // toolbarHeight: 0.1.sh,
    scrolledUnderElevation: 0,
    title: Text(
      'My Booking',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
    ),
    centerTitle: false,
    actions: [
      SizedBox(
        width: 75.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/search-50.png",
              height: 20.h,
              width: 20.w,
            ),
            NotificationIconCustom(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              ),
              height: 20.h,
              width: 20.w,
            ),
          ],
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0.07.sh),
      child: CustomTabs(tabController: tabController),
    ),
  );
}
