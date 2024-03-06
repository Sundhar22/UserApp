import 'package:user_app/src/features/profile/domain/entities/manage_address_entity.dart';

class ManageAddressModel extends ManageAddressEntity {
  const ManageAddressModel({
    required String destiny,
    required String address,
  }) : super(
          destiny: destiny,
          address: address,
        );

  factory ManageAddressModel.fromjson(Map<String, dynamic> json) {
    return ManageAddressModel(
      destiny: json['destiny'] ?? "",
      address: json['address'] ?? "",
    );
  }
}
