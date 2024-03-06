part of 'managae_address_bloc.dart';

sealed class ManagaeAddressState extends Equatable {
  const ManagaeAddressState();
  
  @override
  List<Object> get props => [];
}

final class ManagaeAddressInitial extends ManagaeAddressState {}
