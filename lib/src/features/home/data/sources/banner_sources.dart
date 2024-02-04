import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/features/home/data/models/banner_models.dart';

abstract class BannerRemoteDataSource {
  Future<BannerModel> getBanners();
}

class BannerRemoteDataSourceImp implements BannerRemoteDataSource {
  final CollectionReference collectionReference;

  BannerRemoteDataSourceImp({required this.collectionReference});

  @override
  Future<BannerModel> getBanners() async {
    throw UnimplementedError();
  }
}
