import 'package:flutter/material.dart';
import '../functions/debouncer.dart';
import '../widgets/search_page_topbar.dart';
import '../widgets/search_results.dart';

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
