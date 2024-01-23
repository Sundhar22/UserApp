import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.tileHeading,
    required this.children,
  });

  final String tileHeading;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.white,
              ),
            ], borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: ExpansionTile(
              initiallyExpanded: true,
              shape: Border.all(color: Colors.transparent),
              clipBehavior: Clip.hardEdge,
              title: Row(
                children: [
                  Container(
                    height: 25.h,
                    width: 3.w,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      tileHeading,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Icon(
                Icons.more_horiz,
                size: 25.sp,
                color: Colors.black,
              ),
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
