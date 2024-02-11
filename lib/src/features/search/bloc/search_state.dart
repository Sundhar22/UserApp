// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

class SearchState {
  String searchTerm;
  List<SearchModel> suggestions;
  bool isProcessing;

  SearchState({
    this.searchTerm = "",
    this.suggestions = const [],
    this.isProcessing = false,
  });

  SearchState copyWith({
    String? searchTerm,
    List<SearchModel>? suggestions,
    bool? isProcessing,
  }) {
    return SearchState(
      searchTerm: searchTerm ?? this.searchTerm,
      suggestions: suggestions ?? this.suggestions,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }
}
