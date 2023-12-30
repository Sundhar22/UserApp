import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/ui/installation_choices.dart';
import 'package:user_app/features/order/ui/pick_service_date.dart';
import 'package:user_app/features/order/ui/pick_service_time.dart';
import 'package:user_app/features/order/ui/service_quantity.dart';
import 'package:user_app/features/order/ui/type_of_service.dart';
import 'package:user_app/features/order/widgets/order_title.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        bool isInstallation = state.requestType == "Installation";
        return Scaffold(
          extendBody: true,
          bottomSheet: (state.requestType != "" &&
                  state.serviceDate != "" &&
                  state.serviceTime != "" &&
                  state.productQuantity != 0)
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 58.h,
                    color: isInstallation ? Colors.blue : Colors.red,
                    child: Center(
                        child: Text(
                      isInstallation
                          ? "Request Installation"
                          : "Request Repair",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )),
                  ),
                )
              : null,
          appBar: AppBar(
            backgroundColor: state.requestType == ""
                ? Colors.grey.withOpacity(.1)
                : state.requestType == "Installation"
                    ? Colors.blueAccent.withOpacity(.1)
                    : Colors.redAccent.withOpacity(.1),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            title: const Text("Request Service"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size(double.maxFinite, 40.h),
              child: const TypeOfService(),
            ),
          ),
          body: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InstallationChoice(),
                SelectQuantity(),
                PickServiceDate(),
                ServiceTime(),
                OptionalMessage(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class OptionalMessage extends StatelessWidget {
  const OptionalMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderTitle(title: "Optional Instructions"),
          const SizedBox(height: 15),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return TextField(
                minLines: 1,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Your Instructions goes here",
                  contentPadding: EdgeInsets.all(10.r),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                onSubmitted: (s) {
                  state.productQuantity = int.parse(s);
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                textInputAction: TextInputAction.done,
              );
            },
          ),
        ],
      ),
    );
  }
}
