import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/routes.dart';

import '../../../../core/constants/constants.dart';
import '../widgets/location_widgets.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userLocationAppBar(context),
      body: Container(
        color: AppColor.primaryColor,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            DraggableScrollableSheet(
                initialChildSize: 0.45.h,
                maxChildSize: 0.5.h,
                minChildSize: 0.2.h,
                builder: (context, scrollController) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification notification) {
                        notification.disallowIndicator();
                        return true;
                      },
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: dragIndicator()),
                              locationHead(),
                              SizedBox(height: 10.h),
                              locationInputTextFelid(
                                  tittle: "Apartment Name  (Optional)"),
                              SizedBox(height: 10.h),
                              locationInputTextFelid(
                                  tittle: "Apartment Name  (Optional)"),
                              SizedBox(height: 10.h),
                              locationInputTextFelid(tittle: "Address Line"),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          ElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              RoutesName.appPage,
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r)),
                            ),
                            child: const Text("Save Address",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
