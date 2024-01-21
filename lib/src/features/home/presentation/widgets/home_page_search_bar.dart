import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.onTap,
    this.padding,
  });

  final String hintText;
  final Function(String val) onChanged;
  final void Function() onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(top: 15.h, bottom: 10.h, left: 10.w, right: 10.w),
      child: SizedBox(
        height: 39.h,
        child: SearchBar(
          onTap: onTap,
          onChanged: onChanged,
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
          hintText: hintText,
          hintStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          leading: Image.asset(
            'assets/icons/search-50.png',
            height: 20.h,
            width: 20.w,
            color: Colors.grey.shade700,
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
          ),
        ),
      ),
    );
  }
}
