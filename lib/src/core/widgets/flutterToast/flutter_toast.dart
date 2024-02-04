import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

toastMessage(String message, BuildContext context, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      animation: CurvedAnimation(
        parent: const AlwaysStoppedAnimation(1),
        curve: Curves.easeIn,
      ),
      behavior: SnackBarBehavior.floating,
      
       
      shape: const RoundedRectangleBorder(),
      backgroundColor: color,
      elevation: 0,
      content: Text(message,
          style: TextStyle(
              fontSize: 17.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600)),
      duration: const Duration(seconds: 1),
    ),
  );
}
