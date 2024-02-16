import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../functions/search_function.dart';
import '../pages/search_page.dart';

class SearchPageTopBar extends StatelessWidget {
  const SearchPageTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5.w, top: 10.h),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: Colors.grey.withOpacity(.1),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: TextField(
                  autocorrect: true,
                  autofocus: true,
                  onChanged: (value) {
                    debouncer.run(() => searchFunction(value, context));
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your query here",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
