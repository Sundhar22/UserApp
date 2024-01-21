import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/order/presentation/pages/type_of_service.dart';

import '../bloc/order_bloc.dart';
import '../bloc/order_events.dart';
import '../bloc/order_state.dart';

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
