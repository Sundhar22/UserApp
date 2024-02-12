import 'package:dartz/dartz.dart';
import 'package:user_app/src/core/error/error.dart';
import 'package:user_app/src/features/home/domain/entities/entities.dart';

import '../repositories/banner_repositories.dart';

class GetOfferBannerUseCase {
  final BannerRepository repository;

  GetOfferBannerUseCase({required this.repository});

  Future<Either<Failure, List<BannerEntity>>> call() async {
    return await repository.getBanners();
  }
}
