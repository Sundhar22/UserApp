import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/widgets/notification/model/notification_model.dart';

import 'widgets/notification_widgets.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  final List<NotificationContent> tempNotification = [
    NotificationContent(
      title: "Your order is confirmed",
      content:
          "Your order is confirmed and will be delivered between 3:00 PM to 4:00 PM",
      date: '2023-11-23',
    ),
    NotificationContent(
      title: "New Offers",
      content: "New offers are available on your favourite products",
      date: '2021-11-23',
    ),
    NotificationContent(
      title: "Account Verification",
      content: "Your account is verified successfully",
      date: '2021-11-21',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: notificationAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                notificationWidget(
                  tempNotification,
                ),
              ],
            ),
          ),
        ));
  }

  Column notificationWidget(List<NotificationContent> notificationContent) {
    // only today notification
    List<NotificationContent> todayNotification = notificationContent
        .where((element) =>
            element.date ==
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}")
        .toList();
    // only previous notification
    List<NotificationContent> previousNotification = notificationContent
        .where((element) =>
            element.date !=
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}")
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            "Today",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
        for (var i = 0; i < todayNotification.length; i++)
          notificationCardWidget(
              todayNotification[i].title, todayNotification[i].content),
        SizedBox(
          child: Text(
            "Previous",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
        for (var i = 0; i < previousNotification.length; i++)
          notificationCardWidget(
              previousNotification[i].title, previousNotification[i].content),
      ],
    );
  }
}
