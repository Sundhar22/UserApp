import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'managae_address_event.dart';
part 'managae_address_state.dart';

class ManagaeAddressBloc extends Bloc<ManagaeAddressEvent, ManagaeAddressState> {
  ManagaeAddressBloc() : super(ManagaeAddressInitial()) {
    on<ManagaeAddressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
