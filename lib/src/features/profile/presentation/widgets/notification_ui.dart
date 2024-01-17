import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/colors/app_color.dart';
import 'package:user_app/features/profile/profile_widgets/custom_appbar.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Notification"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                ),
                Switch(
                  value: light,
                  activeColor: AppColor.primaryColor,
                  thumbColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.black;
                      }
                      return Colors.white;
                    },
                  ),
                  onChanged: (bool value) {
                    setState(
                      () {
                        light = value;
                      },
                    );
                  },
                ),
              ],
            ),
            _buildNotificationExplanation(),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationExplanation() {
    return Text(
      "Customize your notification settings to stay informed about important updates and offers.",
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColor.textSecondaryColor,
      ),
    );
  }
}
