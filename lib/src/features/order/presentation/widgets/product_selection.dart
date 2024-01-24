import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/constants/colors.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';

// Sample DataSet
final List<String> name = ["Sealig", "Home", "Veranda", "Vannila"];

// Generated DataSet
final List<bool> isSelectedData = [false, false, false, false];
final List<IconData> iconData = [
  Icons.home,
  Icons.breakfast_dining,
  Icons.ac_unit_rounded,
  Icons.zoom_out_map_outlined
];
final List<int> count = [0, 0, 0, 0];

class ProductIndicator extends StatelessWidget {
  const ProductIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderTile(
      tileHeading: "Product",
      children: [
        SizedBox(
          height: 90.h,
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: name.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          actions: isSelectedData[index]
                              ? [
                                  TextButton(
                                    onPressed: () {
                                      isSelectedData[index] = false;
                                      BlocProvider.of<OrderBloc>(context).add(
                                        OrderProductUpdateEvent(),
                                      );
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
                              'Enter the number of ${name[index]} Light to be ${state.requestType}ed'),
                          content: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              hintText: "Enter the quantity",
                              border: OutlineInputBorder(),
                            ),
                            onSubmitted: (value) {
                              count[index] = int.parse(value);
                              isSelectedData[index] = true;
                              BlocProvider.of<OrderBloc>(context).add(
                                OrderProductUpdateEvent(),
                              );
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
                        color: isSelectedData[index]
                            ? AppColor.primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: !isSelectedData[index]
                              ? Colors.grey
                              : Colors.transparent,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: !isSelectedData[index]
                                ? Icon(
                                    iconData[index],
                                    size: 20.sp,
                                    color: !isSelectedData[index]
                                        ? Colors.black.withOpacity(.6)
                                        : Colors.white,
                                  )
                                : Text(
                                    "${count[index]}X",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                          Text(
                            name[index],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: isSelectedData[index]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
