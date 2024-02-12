import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';

class CustomDropDown extends StatelessWidget {
  final String value;
  final List<String> itemsList;
  final Color dropdownColor;
  const CustomDropDown({
    super.key,
    required this.value,
    required this.itemsList,
    required this.dropdownColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) {
        return (previous.serviceIssue != current.serviceIssue);
      },
      builder: (context, state) {
        final bool isServiceFilled = state.serviceIssue == '';
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                  // color: ,
                ),
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: DropdownButton(
                      isExpanded: true,
                      dropdownColor: dropdownColor,
                      value: isServiceFilled ? value : state.serviceIssue,
                      alignment: Alignment.bottomRight,
                      items: itemsList
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (dropDownValue) {
                        if (dropDownValue != null &&
                            state.serviceIssue != dropDownValue) {
                          BlocProvider.of<OrderBloc>(context).add(
                            OrderDropDownEvent(orderIssue: dropDownValue),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
