import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/resources/data_state.dart';
import 'package:user_app/src/core/usecases/usecases.dart';
import 'package:user_app/src/features/profile/domain/entities/manage_address_entity.dart';
import 'package:user_app/src/features/profile/domain/repositories/manage_address_repository.dart';

class ManageAddressUsecase
    implements UseCase<Either<DataFetchFailure, ManageAddressEntity>, void> {
  final ManageAddressRepository _manageAddressRepository;

  ManageAddressUsecase(this._manageAddressRepository);
  @override
  Future<Either<DataFetchFailure, ManageAddressEntity>> call({void params}) {
    return _manageAddressRepository.fetchUserAddress();
  }
}
