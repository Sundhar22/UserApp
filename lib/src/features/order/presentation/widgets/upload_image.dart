import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_events.dart';
import '../bloc/order_state.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(3.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: ListTile(
              onTap: () async {
                final List<XFile> imageList =
                    await state.imagePicker.pickMultiImage();
                if (context.mounted) {
                  if (imageList.isNotEmpty) {
                    BlocProvider.of<OrderBloc>(context).add(
                      OrderPickImageEvent(imageLinks: imageList),
                    );
                  }
                }
              },
              leading: const Icon(Icons.image_outlined),
              title: Text(
                state.imageLinks.isNotEmpty
                    ? "Images Picked ${state.imageLinks.length}X"
                    : "Upload Images",
              ),
            ),
          );
        },
      ),
    );
  }
}
