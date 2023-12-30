import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/colors/app_color.dart';
import 'package:user_app/features/profile/profile_widgets/custom_appbar.dart';

enum MessageType {
  serviceProvider,
  user,
}

class CustomerService extends StatefulWidget {
  const CustomerService({super.key});

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar("Customer Service"),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        onClosing: () {},
        builder: (BuildContext context) => _customTextFeild(),
      ),
      body: SizedBox(
        width: 380.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _serviceProvideContainer("Hello Good Morning", "09:41 AM"),
            _serviceProvideContainer(
                "I am a customer service, is there anything i can help you with?",
                "09:41 AM"),
            _userContainer(
                "Hi, I am having problem with my service payment", "09:42 AM"),
          ],
        ),
      ),
    );
  }

  Widget _customTextFeild() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: 280.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 25.w,
                      maxWidth: 300.w,
                      minHeight: 50.0,
                      maxHeight: 135.0,
                    ),
                    child: const Scrollbar(
                      child: TextField(
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            left: 15.0,
                            bottom: 2.0,
                          ),
                          hintText: "Message",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.image,
                  color: AppColor.textSecondaryColor.withOpacity(0.5),
                )
              ],
            ),
          ),
          Container(
            height: 35.h,
            width: 35.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColor,
            ),
            child: const Center(
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceProvideContainer(String content, String time) {
    return _messageContainer(content, time, MessageType.serviceProvider);
  }

  Widget _userContainer(String content, String time) {
    return _messageContainer(content, time, MessageType.user);
  }

  Widget _messageContainer(String content, String time, MessageType type) {
    final bool isServiceProvider = type == MessageType.serviceProvider;

    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 260.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: isServiceProvider
              ? const Radius.circular(0)
              : const Radius.circular(10),
          topRight: isServiceProvider
              ? const Radius.circular(10)
              : const Radius.circular(0),
          bottomLeft: const Radius.circular(10),
          bottomRight: const Radius.circular(10),
        ),
        color: isServiceProvider
            ? AppColor.textSecondaryColor.withOpacity(0.1)
            : AppColor.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 180.w,
            child: Text(
              content,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: isServiceProvider
                    ? AppColor.textPrimaryColor
                    : Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12.sp,
              color: isServiceProvider
                  ? AppColor.textSecondaryColor
                  : Colors.white.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
