import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_bloc.dart';
import '../model/search_model.dart';

Map<String, Map<String, List>> mapArray = {
  "Light": {
    'Install': ['Veranda', 'Balcony', 'Sealing'],
    'Service': ['Fused', 'choked', 'Light Not Working', 'Choke got bursted'],
  },
  'Fan': {
    'Install': ['Sealing', 'Couch'],
    'Service': [
      'Regulator fuse',
    ],
  },
};

Future<void> searchFunction(String searchTerm, BuildContext context) async {
  BlocProvider.of<SearchBloc>(context).add(
    SearchUIUpdate(isSearching: true),
  );
  if (searchTerm == '') {
    BlocProvider.of<SearchBloc>(context).add(
      SearchUIUpdate(isSearching: false),
    );

    BlocProvider.of<SearchBloc>(context).add(SearchSuggestionUpdate(
      suggestionList: [SearchModel(searchTerm: '', searchOptions: '')],
    ));

    return;
  }
  searchTerm = searchTerm.toLowerCase();
  List<SearchModel> results = [];
  for (String key in mapArray.keys) {
    if (key.toLowerCase().contains(searchTerm)) {
      results.add(SearchModel(
        searchTerm: key,
        searchOptions: mapArray[key]?.keys.toString() ?? '',
      ));
      await Future.delayed(Durations.long2);
      if (context.mounted) {
        BlocProvider.of<SearchBloc>(context).add(SearchSuggestionUpdate(
          suggestionList: results,
        ));
        BlocProvider.of<SearchBloc>(context).add(
          SearchUIUpdate(isSearching: false),
        );
      }
    }
  }

  if (results.isEmpty) {
    mapArray.forEach((key, value) {
      value.forEach((innerKey, innerValue) async {
        for (var item in innerValue) {
          if (item.toLowerCase().contains(searchTerm.toLowerCase())) {
            results.add(SearchModel(
              searchTerm: item,
              searchOptions: "match found in $key",
            ));
          }
        }
        log(results.toString());
        await Future.delayed(Durations.short4);

        if (context.mounted) {
          if (results.isEmpty) {
            BlocProvider.of<SearchBloc>(context).add(SearchSuggestionUpdate(
              suggestionList: [SearchModel(searchTerm: '', searchOptions: '')],
            ));
          }
          BlocProvider.of<SearchBloc>(context).add(SearchSuggestionUpdate(
            suggestionList: results,
          ));

          BlocProvider.of<SearchBloc>(context).add(
            SearchUIUpdate(isSearching: false),
          );
        }
      });
    });
  }
}
