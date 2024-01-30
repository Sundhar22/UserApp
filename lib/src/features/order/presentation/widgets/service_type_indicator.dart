import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';

import '../../../../core/constants/constants.dart';

class ServiceTypeIndicator extends StatelessWidget {
  const ServiceTypeIndicator({super.key});

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
            final bool isInstallation = state.requestType == "Install";
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<OrderBloc>(context).add(
                      OrderTypeUpdate(
                        typeOfService: "Install",
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: isInstallation
                          ? AppColor.primaryColor
                          : const Color.fromRGBO(0, 0, 0, 0),
                      border: Border.all(
                        color:
                            isInstallation ? Colors.transparent : Colors.grey,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.auto_awesome_outlined,
                          color: isInstallation ? Colors.white : Colors.black,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Install",
                          style: TextStyle(
                            color: isInstallation ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<OrderBloc>(context).add(
                      OrderTypeUpdate(
                        typeOfService: "Repair",
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: !isInstallation
                            ? AppColor.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: !isInstallation
                              ? Colors.transparent
                              : Colors.black,
                        )),
                    child: Column(
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          color: !isInstallation ? Colors.white : Colors.black,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Repair",
                          style: TextStyle(
                            color:
                                !isInstallation ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
