import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_range/time_range.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';

Future<TimeRangeResult?> showTimeRangePicker(BuildContext context) async {
  await showDialog<TimeRangeResult?>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        insetPadding: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        elevation: 0,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Select Service Time Range'),
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 190,
            child: TimeRange(
              fromTitle: const Text(
                'From',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              toTitle: const Text(
                'To',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              titlePadding: 20,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              activeTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              borderColor: Colors.black,
              backgroundColor: Colors.transparent,
              activeBackgroundColor: Colors.blue,
              activeBorderColor: Colors.transparent,
              firstTime: const TimeOfDay(hour: 08, minute: 30),
              lastTime: const TimeOfDay(hour: 20, minute: 00),
              timeStep: 10,
              timeBlock: 30,
              onRangeCompleted: (TimeRangeResult? range) {
                if (range != null) {
                  print(range.start);
                  print(range.end);
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
