import 'package:flutter/material.dart';
import 'package:user_app/features/booking/ui/widgets/booking_card_widget.dart';
import 'package:user_app/features/booking/ui/widgets/booking_widgets.dart';

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
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookingAppBar(_tabController, context),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SingleChildScrollView(
            child: Column(
              children: [
                BookingCard(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BookingCard(),
                BookingCard(),
                BookingCard(),
                BookingCard(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BookingCard(),
                BookingCard(),
                BookingCard(),
                BookingCard(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BookingCard(),
                BookingCard(),
                BookingCard(),
                BookingCard(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BookingCard(),
                BookingCard(),
                BookingCard(),
                BookingCard(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BookingCard(),
                BookingCard(),
                BookingCard(),
                BookingCard(),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                BookingCard(),
                BookingCard(),
                BookingCard(),
                BookingCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
