import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/ui/type_of_service.dart';

AppBar buildAppBar(OrderState state) {
  return AppBar(
    backgroundColor: state.requestType == "Installation"
        ? Colors.blueAccent.withOpacity(.1)
        : Colors.redAccent.withOpacity(.1),
    leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
    title: const Text("Request Service"),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size(double.maxFinite, 40.h),
      child: const TypeOfService(),
    ),
  );
}
