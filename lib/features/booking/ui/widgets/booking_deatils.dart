import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/colors/app_color.dart';

class BookingDetails extends StatelessWidget {
  final Container editingWidget;
  final BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.black12.withOpacity(0.03),
    borderRadius: BorderRadius.circular(10.r),
  );

  BookingDetails({super.key, required this.editingWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookingDetailAppBar(context),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: editingWidget,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The Top Header Widget contain Booking ID and Status
              idAndStatusWidgets(),
              // The Top Widget contain the Booking Details
              bookingDetailsWidget(),
              Divider(
                color: Colors.grey.withOpacity(.20),
              ),
              SizedBox(height: 5.h),
              // The Middle Widget contain the Transaction ID
              transactionIDWidget(),
              SizedBox(height: 4.h),
              // The Middle Widget contain the Payment Details
              paymentDetailsWidget(),
              SizedBox(height: 5.h),
              // The Bottom Widget contain the amount details
              amountDetailsWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Container amountDetailsWidgets() {
    return Container(
      height: 128.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: containerDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          detailCard(title: "Subtotal", value: '₹ 1000'),
          detailCard(title: "Discount", value: '₹ 100'),
          detailCard(title: "Tax", value: '₹ 100'),
          Divider(
            color: Colors.grey.withOpacity(.20),
          ),
          detailCard(
            title: "Total price",
            value: Text(
              '₹ 1000',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container paymentDetailsWidget() {
    return Container(
      height: 128.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: containerDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          detailCard(title: "Payment Method", value: 'Upi'),
          detailCard(title: "Date", value: '12/12/2021'),
          detailCard(title: "Time", value: '1:00 PM'),
          detailCard(
              title: "Payment Status",
              value: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  'Paid',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Column transactionIDWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transaction ID:',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        Text(
          "#12345678EGF",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Container bookingDetailsWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      width: double.infinity,
      decoration: containerDecoration,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cleaning",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text("House,kitchen & Bathroom cleaning",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              )),
          SizedBox(height: 1.h),
          Divider(
            color: Colors.grey.withOpacity(.20),
          ),
          SizedBox(
            height: 90.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailCard(title: "Date", value: "12/12/2021"),
                detailCard(title: "Time", value: "12:00 PM"),
                detailCard(title: "Location", value: "123, Street, City"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row detailCard({required String title, required value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
          ),
        ),
        value is String
            ? Text(value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ))
            : value
      ],
    );
  }

  Row idAndStatusWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Booking ID
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking ID:',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            Text(
              "#12345678EGF",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        // "Booking Status"
        Container(
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            'Scheduled',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  AppBar bookingDetailAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
