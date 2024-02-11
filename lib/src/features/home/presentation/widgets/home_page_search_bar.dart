import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/search/pages/search_page.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchPage(),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(12.h),
        margin:
            EdgeInsets.only(top: 15.h, bottom: 10.h, left: 10.w, right: 10.w),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.all(Radius.circular(18.r)),
        ),
        child: Row(
          children: [
            const Icon(Icons.search),
            SizedBox(
              width: 10.w,
            ),
            const Text("Search for services"),
          ],
        ),
      ),
    );
  }
}
