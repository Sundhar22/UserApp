import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/features/home/data/models/banner_models.dart';

abstract class BannerRemoteDataSource {
  Future<List<BannerModel>> getBanners();
}

class BannerRemoteDataSourceImp implements BannerRemoteDataSource {
  final CollectionReference collectionReference;

  BannerRemoteDataSourceImp({required this.collectionReference});

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      final snapshot =
          await collectionReference.get(); // Await the query result
      List<Map<String, dynamic>> data = []; // Specify the type for clarity
      for (var element in snapshot.docs) {
        var r = element.data() as Map<String, dynamic>;
        data.add(r);
      }
      return data
          .map((e) => BannerModel.fromJson(e))
          .toList(); // Assuming you have a fromJson method in BannerModel
    } catch (e) {
      throw Exception(e);
    }
  }
}

