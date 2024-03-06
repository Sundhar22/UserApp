import 'package:equatable/equatable.dart';

class ManageAddressEntity extends Equatable {
  final String destiny;
  final String address;

  const ManageAddressEntity({
    required this.destiny,
    required this.address,
  });

  @override
  List<Object?> get props {
    return [
      destiny,
      address,
    ];
  }
}
