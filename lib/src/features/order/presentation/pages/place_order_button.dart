import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/order_bloc.dart';
import '../bloc/order_state.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        // build
        bool isInstallation = state.requestType == "Installation";
        return Container(
          height: 58.h,
          color: isInstallation ? Colors.blue : Colors.red,
          child: Center(
              child: Text(
            isInstallation ? "Request Installation" : "Request Repair",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )),
        );
      },
    );
  }
}
