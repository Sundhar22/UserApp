import 'package:bloc/bloc.dart';
import 'package:user_app/src/features/search/model/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchSuggestionUpdate>((event, emit) {
      if (event.suggestionList.isNotEmpty) {
        emit(state.copyWith(suggestions: event.suggestionList));
      }
    });

    on<SearchUIUpdate>((event, emit) {
      emit(state.copyWith(isProcessing: event.isSearching));
    });
  }
}
