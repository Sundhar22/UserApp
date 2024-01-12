
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:meta/meta.dart';
  
  part 'application_event.dart';
  part 'application_state.dart';
  
  class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
    ApplicationBloc() : super(ApplicationInitial()) {
      on<ApplicationEvent>((event, emit) {
        // TODO: implement event handler
      });
    }
  }
