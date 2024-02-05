import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';
import 'package:user_app/src/features/order/presentation/widgets/optional_textfield.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';
import 'package:user_app/src/features/order/presentation/widgets/upload_image.dart';

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
