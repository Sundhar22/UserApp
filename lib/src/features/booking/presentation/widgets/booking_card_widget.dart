import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/booking/presentation/widgets/booking_deatils.dart';

import '../../../../core/constants/constants.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({super.key});

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // whole card container and its decoration
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        // height: 200.h,
        width: 330.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        // whole card child column
        child: Column(
          children: [
            // Booking Card Header Section which contains ID and View Details Button
            cardHeader(context),
            // Booking Card Body Section which contains Service Type,Booking Status and Picture
            cardBody(),
            // Booking Card Bottom Section which contains Date,Time and Price
            cardBottom(),
            // Booking Card Footer Section which contains Cancel Button and Modification Button
            cardFooter()
          ],
        ),
      ),
    );
  }

  Container cardFooter() {
    return Container(
      margin: EdgeInsets.only(top: 3.h, bottom: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Modification Button
          ElevatedButton(
            onPressed: () {},
            style: buttonStyle1(AppColor.primaryColor),
            child: Text(
              "Modification",
              style: TextStyle(
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          // Cancel Button
          ElevatedButton(
            onPressed: () {
              // alterDialog
              showDialogWidget();
            },
            style: buttonStyle2(Colors.grey.shade300),
            child: Text(
              "Cancel Booking",
              style: TextStyle(
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDialogWidget() {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            height: 150.h,
            width: 300.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white
              // .withOpacity(.9)
              ,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                // AlertDialog Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/cross.png',
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Are you sure ?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                // AlertDialog Content
                Container(
                  margin: EdgeInsets.only(top: 5.h),
                  child: Text(
                    "Are you sure you want to cancel this booking?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // AlertDialog Actions
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: buttonStyle1(Colors.grey.shade300),
                        child: Text(
                          "Don't Cancel ",
                          style: TextStyle(
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: buttonStyle1(Colors.red.withOpacity(.9)),
                        child: Text(
                          "Cancel Booking",
                          style: TextStyle(
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ButtonStyle buttonStyle2(Color color) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.r),
          side: BorderSide(color: color),
        ),
      ),
    );
  }

  ButtonStyle buttonStyle1(Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
          side: BorderSide(color: color),
        ),
      ),
    );
  }

  Row cardBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Date Container
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child: Text(
                  "Date :",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  "12/12/2021",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Time Container
        Container(
          margin: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child: Text(
                  "Time :",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  "12:00 PM",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Price Container
        Container(
          margin: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.h),
                child: Text(
                  "Price :",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  "Rs. 500",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container cardBody() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          // Image Container
          Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          //  Service Type and Booking Status Container
          Container(
            margin: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Service Type Container
                Container(
                  margin: EdgeInsets.only(bottom: 4.h),
                  child: Text(
                    // "Service Type",
                    "Cleaning",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Booking Status Container
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    // "Booking Status"
                    'Scheduled',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container cardHeader(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'ID: ',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal)),
                TextSpan(
                    text: '1234567890',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BookingDetails(
                  editingWidget: cardFooter(),
                );
              }));
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(
              "View Details",
              style: TextStyle(
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
