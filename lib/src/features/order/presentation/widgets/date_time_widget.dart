import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_events.dart';
import '../bloc/order_state.dart';
import '../functions/format_date.dart';
import '../functions/show_dialog.dart';
import 'order_expansion_tile.dart';

class DateTimeIndicator extends StatelessWidget {
  const DateTimeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderTile(
      tileHeading: "Date & Time",
      children: [
        BlocBuilder<OrderBloc, OrderState>(
          buildWhen: (previous, current) {
            return (previous.serviceDate != current.serviceDate ||
                previous.serviceTime != current.serviceTime);
          },
          builder: (context, state) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDateTime = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 3)),
                    );
                    if (selectedDateTime != null) {
                      if (context.mounted) {
                        BlocProvider.of<OrderBloc>(context).add(
                            OrderTimingsUpdate(
                                dateOfService: formatDate(selectedDateTime)));
                      }
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.calendar_today_sharp,
                        size: 20.sp,
                        color: AppColor.primaryColor,
                      ),
                      title: Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        state.serviceDate,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    showTimeRangePicker(context);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        )),
                    child: ListTile(
                      leading: Icon(
                        Icons.access_time_rounded,
                        size: 20.sp,
                        color: AppColor.primaryColor,
                      ),
                      title: Text(
                        "Time",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        state.serviceTime,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
