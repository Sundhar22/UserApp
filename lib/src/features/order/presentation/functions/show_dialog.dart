import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_range/time_range.dart';
import 'package:user_app/src/core/constants/colors.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/functions/format_time.dart';

Future<TimeRangeResult?> showTimeRangePicker(BuildContext context) async {
  await showDialog<TimeRangeResult?>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        insetPadding: EdgeInsets.all(20.h),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        elevation: 0,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Select Service Time Range'),
        children: <Widget>[
          SizedBox(
            height: 180.h,
            width: 190.w,
            child: TimeRange(
              fromTitle: Text(
                'From',
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              toTitle: Text(
                'To',
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              titlePadding: 20,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              activeTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              borderColor: Colors.black,
              backgroundColor: Colors.transparent,
              activeBackgroundColor: AppColor.primaryColor,
              activeBorderColor: Colors.transparent,
              firstTime: const TimeOfDay(hour: 09, minute: 00),
              lastTime: const TimeOfDay(hour: 20, minute: 00),
              timeStep: 30,
              timeBlock: 30,
              onRangeCompleted: (TimeRangeResult? range) {
                if (range != null) {
                  BlocProvider.of<OrderBloc>(context).add(
                    OrderTimingsUpdate(
                      timeOfService:
                          "${formatTimeOfDay(range.start)} - ${formatTimeOfDay(range.end)}",
                    ),
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      );
    },
  );
  return null;
}
