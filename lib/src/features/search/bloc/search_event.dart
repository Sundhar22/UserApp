// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchSuggestionUpdate extends SearchEvent {
  List<SearchModel> suggestionList;

  SearchSuggestionUpdate({
    this.suggestionList = const [],
  });

  SearchSuggestionUpdate copyWith({
    List<SearchModel>? suggestionList,
  }) {
    return SearchSuggestionUpdate(
      suggestionList: suggestionList ?? this.suggestionList,
    );
  }
}

class SearchUIUpdate extends SearchEvent {
  bool isSearching;

  SearchUIUpdate({
    this.isSearching = false,
  });

  SearchUIUpdate copyWith({
    bool? isSearching,
  }) {
    return SearchUIUpdate(
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
