import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_events.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/functions/format_date.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.date,
    required this.isSelected,
    required this.typeOfService,
    required this.isPickable,
  });

  final String date;
  final String typeOfService;
  final bool isPickable, isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            if (isPickable) {
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 7)),
                initialDate: DateTime.now(),
              );
              if (date != null && context.mounted) {
                BlocProvider.of<OrderBloc>(context)
                    .add(OrderTimingsUpdate(dateOfService: formatDate(date)));
              }
            } else {
              BlocProvider.of<OrderBloc>(context)
                  .add(OrderTimingsUpdate(dateOfService: date));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 10.h, right: 15.w, left: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: returnColor(),
                border: Border.all(
                  width: 1.w,
                  color: !isSelected ? Colors.grey : Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPickable
                      ? Icons.calendar_month
                      : date == "Today"
                          ? Icons.arrow_downward
                          : Icons.refresh_rounded,
                  color: textColor(),
                ),
                SizedBox(width: 10.w),
                Text(
                  date,
                  style: TextStyle(
                    color: textColor(),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color textColor() => isSelected ? Colors.white : Colors.black;

  Color returnColor() {
    return isSelected && typeOfService == "Installation"
        ? Colors.blueAccent
        : isSelected && typeOfService == "Repair"
            ? Colors.redAccent
            : isSelected && typeOfService == "Combo"
                ? Colors.amber
                : Colors.transparent;
  }
}
