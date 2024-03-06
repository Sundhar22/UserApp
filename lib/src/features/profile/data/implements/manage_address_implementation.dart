import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/features/profile/data/sources/manage_address_source.dart';
import 'package:user_app/src/features/profile/domain/entities/manage_address_entity.dart';
import 'package:user_app/src/features/profile/domain/repositories/manage_address_repository.dart';

class ManageAddressImplementation implements ManageAddressRepository {
  final UserAddressFetchSource _addressFetchSource;

  ManageAddressImplementation(this._addressFetchSource);
  @override
  Future<Either<DataFetchFailure, ManageAddressEntity>>
      fetchUserAddress() async {
    try {
      final result = await _addressFetchSource.fetchUserAddress();
      return Right(result);
    } catch (e) {
      return Left(DataFetchFailure("Failed to fetch user details: $e"));
    }
  }
}
