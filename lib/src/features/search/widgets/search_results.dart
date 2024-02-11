import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/constants/constants.dart';

import 'package:user_app/src/features/search/bloc/search_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return !state.isProcessing
              ? state.suggestions.isEmpty ||
                      state.suggestions[0].searchTerm == ''
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("No Matches Found"),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                        itemCount: state.suggestions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.w, vertical: 8.h),
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: AppColor.primaryColor,
                                  child: const Icon(
                                    Icons.history,
                                    color: Colors.white,
                                  )),
                              title: Text(
                                state.suggestions[index].searchTerm,
                              ),
                              trailing: const Icon(Icons.arrow_outward_rounded),
                              subtitle:
                                  Text(state.suggestions[index].searchOptions),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
