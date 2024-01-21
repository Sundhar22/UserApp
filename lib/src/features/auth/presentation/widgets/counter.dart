import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondsCounter extends StatelessWidget {
  const SecondsCounter({super.key});

  // void startTimer() {
  @override
  Widget build(BuildContext context) {
    // int minutes = seconds ~/ 60;
    // int remainingSeconds = seconds % 60;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      child: Container(
        alignment: Alignment.bottomRight,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   '$minutes:${remainingSeconds.toString().padLeft(2, '0')}',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: seconds == 0 ? Colors.red : AppColor.primaryColor,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
