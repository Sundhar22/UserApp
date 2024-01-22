import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/booking/data/models/models.dart';
import 'package:user_app/src/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:user_app/src/features/booking/presentation/bloc/booking_event.dart';
import 'package:user_app/src/features/booking/presentation/bloc/booking_state.dart';
import 'package:user_app/src/features/booking/presentation/widgets/booking_card_widget.dart';
import 'package:user_app/src/features/booking/presentation/widgets/booking_widgets.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
    BlocProvider.of<BookingBloc>(context).add(FetchBookingDetails());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookingAppBar(_tabController, context),
      body: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingLoaded) {
            List<BookingModel> bookingDatas = state.bookingsDetails;
            print('Booking Data Length: ${bookingDatas.length}');
            bookingDatas.sort((a, b) {
              int dateComparison = b.date.compareTo(a.date);
              if (dateComparison == 0) {
                return b.time.compareTo(a.time);
              }
              return dateComparison;
            });

            List<BookingModel> acceptedBookings = bookingDatas
                .where((bookingDatas) => bookingDatas.bookingType == 'Accepted')
                .toList();

            List<BookingModel> canceledBookings = bookingDatas
                .where(
                    (bookingDatas) => bookingDatas.bookingType == 'Cancelled')
                .toList();

            List<BookingModel> upcomingBookings = bookingDatas
                .where(
                    (bookingDatas) => bookingDatas.bookingType == 'Scheduled')
                .toList();

            return TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: upcomingBookings
                        .map(
                          (bookingData) => BookingCard(
                            id: bookingData.id,
                            serviceName: bookingData.serviceName,
                            date: bookingData.date,
                            time: bookingData.time,
                            price: bookingData.price,
                            bookingType: bookingData.bookingType,
                            imgUrl: bookingData.imgUrl,
                            serviceDetail: bookingData.serviceDetail,
                            location: bookingData.location,
                            transactionId: bookingData.transactionId,
                            paymentMethod: bookingData.paymentMethod,
                            paymentStatus: bookingData.paymentStatus,
                            transactionDate: bookingData.transactionDate,
                            transactionTime: bookingData.transactionTime,
                            tax: bookingData.tax,
                            totalPrice: bookingData.totalPrice,
                            subtotal: bookingData.subtotal,
                            discount: bookingData.discount,
                          ),
                        )
                        .toList(),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: acceptedBookings
                        .map(
                          (bookingData) => BookingCard(
                            id: bookingData.id,
                            serviceName: bookingData.serviceName,
                            date: bookingData.date,
                            time: bookingData.time,
                            price: bookingData.price,
                            bookingType: bookingData.bookingType,
                            imgUrl: bookingData.imgUrl,
                            serviceDetail: bookingData.serviceDetail,
                            location: bookingData.location,
                            transactionId: bookingData.transactionId,
                            paymentMethod: bookingData.paymentMethod,
                            paymentStatus: bookingData.paymentStatus,
                            transactionDate: bookingData.transactionDate,
                            transactionTime: bookingData.transactionTime,
                            tax: bookingData.tax,
                            totalPrice: bookingData.totalPrice,
                            subtotal: bookingData.subtotal,
                            discount: bookingData.discount,
                          ),
                        )
                        .toList(),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: canceledBookings
                        .map(
                          (bookingData) => BookingCard(
                            id: bookingData.id,
                            serviceName: bookingData.serviceName,
                            date: bookingData.date,
                            time: bookingData.time,
                            price: bookingData.price,
                            bookingType: bookingData.bookingType,
                            imgUrl: bookingData.imgUrl,
                            serviceDetail: bookingData.serviceDetail,
                            location: bookingData.location,
                            transactionId: bookingData.transactionId,
                            paymentMethod: bookingData.paymentMethod,
                            paymentStatus: bookingData.paymentStatus,
                            transactionDate: bookingData.transactionDate,
                            transactionTime: bookingData.transactionTime,
                            tax: bookingData.tax,
                            totalPrice: bookingData.totalPrice,
                            subtotal: bookingData.subtotal,
                            discount: bookingData.discount,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          } else if (state is BookingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
