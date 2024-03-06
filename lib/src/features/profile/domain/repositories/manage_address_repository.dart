import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/features/profile/domain/entities/manage_address_entity.dart';

abstract class ManageAddressRepository {
  Future<Either<DataFetchFailure, ManageAddressEntity>> fetchUserAddress();
}
