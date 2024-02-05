import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/constants/colors.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';

class ServiceTypeIndicator extends StatelessWidget {
  const ServiceTypeIndicator({
    super.key,
    required this.installationOptions,
  });

  final List<String> installationOptions;

  @override
  Widget build(BuildContext context) {
    return OrderTile(
      tileHeading: "Service Type",
      children: [
        SizedBox(height: 8.h),
        BlocBuilder<OrderBloc, OrderState>(
          buildWhen: (previous, current) {
            return previous.requestType != current.requestType;
          },
          builder: (context, state) {
            return SizedBox(
              height: 65.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: installationOptions.length,
                itemBuilder: (context, index) {
                  return ServiceIndicatorContainer(
                    serviceName: installationOptions[index],
                    isSelected: state.requestType == installationOptions[index],
                  );
                },
              ),
            );
          },
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}

class ServiceIndicatorContainer extends StatelessWidget {
  const ServiceIndicatorContainer({
    super.key,
    required this.isSelected,
    required this.serviceName,
  });

  final String serviceName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<OrderBloc>(context).add(
          OrderTypeUpdate(
            typeOfService: serviceName,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected
              ? AppColor.primaryColor
              : const Color.fromRGBO(0, 0, 0, 0),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.auto_awesome_outlined,
              color: isSelected ? Colors.white : Colors.black,
            ),
            SizedBox(height: 8.h),
            Text(
              serviceName,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
