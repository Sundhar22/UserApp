import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

serviceCardWidget(List<Widget> serviceList, double height) {
  return SizedBox(
    height: height,
    child: GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 5.h,
      childAspectRatio: height == 350.h ? .75 : .8,
      children: serviceList,
    ),
  );
}
