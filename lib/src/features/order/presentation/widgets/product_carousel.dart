import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/constants/colors.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    super.key,
    required this.isInstallation,
    required this.productOptions,
  });
  final List<String> productOptions;
  final bool isInstallation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      buildWhen: (previous, current) {
        return previous.productCountTracker != current.productCountTracker;
      },
      builder: (context, state) {
        // log("The Valuea : ${state.countProductList} ${state.selectedProductList}");
        return SizedBox(
          height: 90.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.productCountTracker.length,
              itemBuilder: (context, index) {
                log(state.productCountTracker.length.toString());
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        actions: state.productCountTracker[index] != 0
                            ? [
                                TextButton(
                                  onPressed: () {
                                    List<int> tempCounter =
                                        state.productCountTracker;
                                    tempCounter[index] = 0;
                                    BlocProvider.of<OrderBloc>(context)
                                        .add(OrderDetailsUpdate(
                                      countTracker: tempCounter,
                                    ));
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Remove Choice",
                                  ),
                                ),
                              ]
                            : [],
                        shape: Border.all(),
                        title: Text(
                            'Enter the number of ${productOptions[index]} Light to be ${state.requestType}ed'),
                        content: TextField(
                          autofocus: true,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            hintText: "Enter the quantity",
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (value) {
                            List<int> tempCounter = state.productCountTracker;
                            tempCounter[index] = int.parse(value);
                            BlocProvider.of<OrderBloc>(context)
                                .add(OrderDetailsUpdate(
                              countTracker: tempCounter,
                            ));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 70.w,
                    margin: EdgeInsets.all(10.r),
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: state.productCountTracker[index] != 0
                          ? AppColor.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: state.productCountTracker[index] == 0
                            ? Colors.grey
                            : Colors.transparent,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state.productCountTracker[index] != 0
                            ? Padding(
                                padding: EdgeInsets.all(8.0.r),
                                child: Text(
                                  "${state.productCountTracker[index]}X",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        Text(
                          productOptions[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: state.productCountTracker[index] != 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
