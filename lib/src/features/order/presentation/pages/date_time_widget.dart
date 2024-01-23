import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';
import 'package:user_app/src/features/order/presentation/functions/format_date.dart';
import 'package:user_app/src/features/order/presentation/functions/show_dialog.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';

class DateTimeIndicator extends StatelessWidget {
  const DateTimeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderTile(
      tileHeading: "Date & Time",
      children: [
        BlocBuilder<OrderBloc, OrderState>(
          buildWhen: (previous, current) {
            return (previous.serviceDate != current.serviceDate ||
                previous.serviceTime != current.serviceTime);
          },
          builder: (context, state) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    DateTime? selectedDateTime = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 3)),
                    );
                    if (selectedDateTime != null) {
                      if (context.mounted) {
                        BlocProvider.of<OrderBloc>(context).add(
                            OrderTimingsUpdate(
                                dateOfService: formatDate(selectedDateTime)));
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.calendar_today_sharp,
                      ),
                      title: const Text("Date"),
                      subtitle: Text(
                        state.serviceDate,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    showTimeRangePicker(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: const ListTile(
                      leading: Icon(
                        Icons.access_time_rounded,
                      ),
                      title: Text("Time"),
                      subtitle: Text(
                        "10:00AM - 01:00PM",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
