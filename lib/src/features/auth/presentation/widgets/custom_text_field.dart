import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldName,
    required this.onSubmitted,
  });

  final String fieldName;
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldName,
            style: TextStyle(
              fontSize: 15.5.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5.h),
          TextField(
            minLines: 1,
            decoration: InputDecoration(
              hintText: "Enter $fieldName",
              contentPadding: EdgeInsets.all(10.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            keyboardType: fieldName == "Email Address"
                ? TextInputType.emailAddress
                : TextInputType.text,
            onChanged: onSubmitted,
            style: TextStyle(
              color: AppColor.textPrimaryColor,
              fontSize: 16.5.sp,
              fontWeight: FontWeight.w500,
            ),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
