import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';
import 'order_expansion_tile.dart';

class ServiceIndicator extends StatelessWidget {
  const ServiceIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderTile(
      tileHeading: "Service",
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColor.primaryColor,
            child: Icon(
              Icons.light,
              color: Colors.white,
              size: 28.sp,
            ),
          ),
          title: Text(
            "Light Regukar Service",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            "Installation / Repair",
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
