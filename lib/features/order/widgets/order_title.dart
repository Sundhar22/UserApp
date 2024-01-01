import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTitle extends StatelessWidget {
  const OrderTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Urbanist',
            ),
          ),
          TextSpan(
            text: " *",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.red,
              fontFamily: 'Urbanist',
            ),
          ),
        ],
      ),
    );
  }
}
