import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_appbar.dart';
import 'models/paymenthistory_model.dart';
import 'paymenthistory_widget.dart';


class PaymentHistory extends StatefulWidget {
  PaymentHistory({super.key});
  final List<PaymentHistoryContent> demoPayment = [
    PaymentHistoryContent(
      id: "1234567890",
      title: "Cleaning",
      content: "House,kitchen & Bathroom cleaning",
      date: '2023-11-23',
      time: '09:41 AM',
      rate: "500.00",
    ),
    PaymentHistoryContent(
      title: "piping",
      content: "Piping at garden",
      date: '2021-11-23',
      time: '09:41 AM',
      id: "1234567891",
      rate: "350.00",
    ),
    PaymentHistoryContent(
      title: "House hold",
      content: "House,kitchen & Bathroom cleaning",
      date: '2021-11-21',
      time: '09:41 AM',
      id: "1234567892",
      rate: "400.00",
    ),
  ];

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Payments"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            paymentHistoryList(
              widget.demoPayment,
            ),
          ],
        ),
      ),
    );
  }

  Column paymentHistoryList(List<PaymentHistoryContent> paymentContent) {
    List<PaymentHistoryContent> todayPayment = paymentContent
        .where((element) =>
            element.date ==
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}")
        .toList();

    List<PaymentHistoryContent> previousPayment = paymentContent
        .where((element) =>
            element.date !=
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}")
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (todayPayment.isNotEmpty)
          SizedBox(
            child: Text(
              "Today",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
          ),
        for (var i = 0; i < todayPayment.length; i++)
          paymnetHistoryWidget(
            todayPayment[i].title,
            todayPayment[i].content,
            todayPayment[i].date,
            todayPayment[i].time,
            todayPayment[i].id,
            todayPayment[i].rate,
          ),
        SizedBox(
          child: Text(
            "Previous",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ),
        for (var i = 0; i < previousPayment.length; i++)
          paymnetHistoryWidget(
            previousPayment[i].title,
            previousPayment[i].content,
            previousPayment[i].date,
            previousPayment[i].time,
            previousPayment[i].id,
            previousPayment[i].rate,
          ),
      ],
    );
  }
}
