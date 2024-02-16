import 'package:dartz/dartz.dart';
import '../../../../core/error/error.dart';
import '../entities/entities.dart';

import '../repositories/banner_repositories.dart';

class GetOfferBannerUseCase {
  final BannerRepository repository;

  GetOfferBannerUseCase({required this.repository});

  Future<Either<Failure, List<BannerEntity>>> call() async {
    return await repository.getBanners();
  }
}
