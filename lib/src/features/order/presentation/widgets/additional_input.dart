import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_state.dart';
import 'optional_textfield.dart';
import 'order_expansion_tile.dart';
import 'upload_image.dart';

class AdditionalDetails extends StatelessWidget {
  const AdditionalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h),
      child: OrderTile(
        tileHeading: "Essentials",
        children: [
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state.requestType == "Install"
                  ? const OptionalTextField()
                  : const Column(
                      children: [
                        OptionalTextField(),
                        UploadImage(),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
