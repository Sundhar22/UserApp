import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/ui/type_of_service.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        bool isInstallation = state.requestType == "Installation";
        return Scaffold(
          bottomSheet: Container(
            height: 58.h,
            color: isInstallation ? Colors.blue : Colors.red,
            child: Center(
                child: Text(
              isInstallation ? "Request Installation" : "Request Repair",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )),
          ),
          appBar: AppBar(
            backgroundColor: state.requestType == "Installation"
                ? Colors.blueAccent.withOpacity(.1)
                : Colors.redAccent.withOpacity(.1),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            title: const Text("Request Service"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size(double.maxFinite, 40.h),
              child: const TypeOfService(),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InstallationChoice(),
              Text(
                "Select Date Of Service",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 55.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DateWidget(),
                    DateWidget(),
                    DateWidget(),
                    DateWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Select Time of Service",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 55.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DateWidget(),
                    DateWidget(),
                    DateWidget(),
                    DateWidget(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: .5,
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.access_time_rounded),
          SizedBox(width: 10),
          Text(
            "Wed, 25th Jan",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class InstallationChoice extends StatelessWidget {
  const InstallationChoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose Which one to install !",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: DropdownMenu(
              initialSelection: "Tube Light",
              inputDecorationTheme: InputDecorationTheme(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: "Tube Light",
                  label: "Tube Light",
                ),
                DropdownMenuEntry(
                  value: "Spot Light",
                  label: "Spot Light",
                ),
                DropdownMenuEntry(
                  value: "Junction Light",
                  label: "Junction Light",
                ),
                DropdownMenuEntry(
                  value: "Celling Light",
                  label: "Celling Light",
                ),
                DropdownMenuEntry(
                  value: "Surface Light",
                  label: "Surface Light",
                ),
                DropdownMenuEntry(
                  value: "Unmossal Light",
                  label: "Unmossal Light",
                ),
                DropdownMenuEntry(
                  value: "Strip Light",
                  label: "Strip Light",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
