import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';

class BookingDetails extends StatelessWidget {
  final Container editingWidget;
  final String bookingDetailId;
  final String bookingDetailServiceName;
  final String bookingDetailBookingStatus;
  final String bookingDetailDate;
  final String bookingDetailTime;
  final String bookingDetailPrice;
  final String bookingDetailImgUrl;
  final String bookingDetailServiceDetail;
  final String bookingDetailLcation;
  final String bookingDetailTransactionId;
  final String bookingDetailPaymentMethod;
  final String bookingDetailTransactionDate;
  final String bookingDetailTransactionTime;
  final String bookingDetailPaymentStatus;
  final String bookingDetailSubtotal;
  final String bookingDetailDiscount;
  final String bookingDetailTax;
  final String bookingDetailTotalPrice;
  final BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.black12.withOpacity(0.03),
    borderRadius: BorderRadius.circular(10.r),
  );

  BookingDetails({
    super.key,
    required this.editingWidget,
    required this.bookingDetailId,
    required this.bookingDetailServiceName,
    required this.bookingDetailBookingStatus,
    required this.bookingDetailDate,
    required this.bookingDetailTime,
    required this.bookingDetailPrice,
    required this.bookingDetailImgUrl,
    required this.bookingDetailServiceDetail,
    required this.bookingDetailLcation,
    required this.bookingDetailTransactionId,
    required this.bookingDetailPaymentMethod,
    required this.bookingDetailTransactionDate,
    required this.bookingDetailTransactionTime,
    required this.bookingDetailPaymentStatus,
    required this.bookingDetailSubtotal,
    required this.bookingDetailDiscount,
    required this.bookingDetailTax,
    required this.bookingDetailTotalPrice,
  });

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
              idAndStatusWidgets(
                bookingDetailId,
                bookingDetailBookingStatus,
              ),
              // The Top Widget contain the Booking Details
              bookingDetailsWidget(
                bookingDetailServiceName,
                bookingDetailDate,
                bookingDetailTime,
                bookingDetailServiceDetail,
                bookingDetailLcation,
              ),
              Divider(
                color: Colors.grey.withOpacity(.20),
              ),
              SizedBox(height: 5.h),
              // The Middle Widget contain the Transaction ID
              transactionIDWidget(bookingDetailTransactionId),
              SizedBox(height: 4.h),
              // The Middle Widget contain the Payment Details
              paymentDetailsWidget(
                  bookingDetailPaymentMethod,
                  bookingDetailTransactionDate,
                  bookingDetailTransactionTime,
                  bookingDetailPaymentStatus),
              SizedBox(height: 5.h),
              // The Bottom Widget contain the amount details
              amountDetailsWidgets(
                bookingDetailSubtotal,
                bookingDetailDiscount,
                bookingDetailTax,
                bookingDetailTotalPrice,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container amountDetailsWidgets(
    String subTotal,
    String discount,
    String tax,
    String totalPrice,
  ) {
    return Container(
      height: 128.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: containerDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          detailCard(title: "Subtotal", value: '₹ $subTotal'),
          detailCard(title: "Discount", value: '₹ $discount'),
          detailCard(title: "Tax", value: '₹ $tax'),
          Divider(
            color: Colors.grey.withOpacity(.20),
          ),
          detailCard(
            title: "Total price",
            value: Text(
              '₹ $totalPrice',
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

  Container paymentDetailsWidget(
    String trMethod,
    String trDate,
    String trTime,
    String payStatus,
  ) {
    return Container(
      height: 128.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: containerDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          detailCard(title: "Payment Method", value: trMethod),
          detailCard(title: "Date", value: trDate),
          detailCard(title: "Time", value: trTime),
          detailCard(
              title: "Payment Status",
              value: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  payStatus,
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

  Column transactionIDWidget(String trId) {
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
          trId,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Container bookingDetailsWidget(
    String serviceType,
    String date,
    String time,
    String details,
    String address,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      width: double.infinity,
      decoration: containerDecoration,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceType,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(details,
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
                detailCard(title: "Date", value: date),
                detailCard(title: "Time", value: time),
                detailCard(title: "Location", value: address),
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

  Row idAndStatusWidgets(String id, String bookingStatus) {
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
              id,
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
            color: bookingStatus == 'Scheduled' || bookingStatus == 'Accepted'
                ? Colors.green.shade100
                : Colors.red.shade100,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Text(
            bookingStatus,
            style: TextStyle(
              fontSize: 12.sp,
              color: bookingStatus == 'Scheduled' || bookingStatus == 'Accepted'
                  ? Colors.green
                  : Colors.red,
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
