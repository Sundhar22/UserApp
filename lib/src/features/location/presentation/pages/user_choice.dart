import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/user_choice_widgets.dart';

class UserLocationChoice extends StatelessWidget {
  const UserLocationChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.brown,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 375.w,
                height: 250.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  children: [
                    containerAppBar(),
                    innerContainerWidget(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
