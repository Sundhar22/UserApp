import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/search/bloc/search_bloc.dart';
import 'package:user_app/src/features/search/functions/debouncer.dart';
import 'package:user_app/src/features/search/widgets/search_page_topbar.dart';
import 'package:user_app/src/features/search/widgets/search_results.dart';

Debouncer debouncer = Debouncer(
  milliseconds: 700 * 1,
);

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SearchPageTopBar(),
          SearchResults(),
        ],
      )),
    );
  }
}
