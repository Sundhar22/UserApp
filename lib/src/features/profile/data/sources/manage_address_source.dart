import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/features/profile/data/models/manage_address_model.dart';

abstract class UserAddressFetchSource {
  Future<ManageAddressModel> fetchUserAddress();
}

class ManageAddressSourceImpl implements UserAddressFetchSource {
  final docReference =
      FirebaseFirestore.instance.collection('profile').doc('manageAddress');
  @override
  Future<ManageAddressModel> fetchUserAddress() async {
    try {
      final docSnapshot = await docReference.get();
      final data = docSnapshot.data() as Map<String, dynamic>;
      return ManageAddressModel(
        destiny: data["destiny"],
        address: data["address"],
      );
    } catch (e) {
      throw DataFetchFailure("Failed to fetch profile data: $e");
    }
  }
}
