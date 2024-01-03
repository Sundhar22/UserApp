import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_events.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/widgets/order_title.dart';
import 'package:user_app/features/widgets/flutterToast/flutter_toast.dart';

class ServiceTime extends StatelessWidget {
  const ServiceTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 10, bottom: 5),
          child: OrderTitle(title: "Choose Time Of Service"),
        ),
        BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            bool isTimeSelected = state.serviceTime != "";
            return GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 7.h, left: 10.w),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.w,
                          color:
                              isTimeSelected ? Colors.transparent : Colors.grey,
                        ),
                        color: returnColor(state),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width / 2.3).w,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: isTimeSelected ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            isTimeSelected
                                ? state.serviceTime
                                : "Select time range",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: isTimeSelected
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Color returnColor(OrderState state) {
    return state.serviceTime == ""
        ? Colors.transparent
        : state.requestType == "Installation"
            ? Colors.blueAccent
            : state.requestType == "Repair"
                ? Colors.redAccent
                : Colors.transparent;
  }
}
