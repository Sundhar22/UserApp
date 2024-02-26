import 'package:user_app/src/features/home/data/sources/remote/home_remote_sources.dart';
import 'package:user_app/src/features/home/domain/entities/home_entity.dart';
import 'package:user_app/src/features/home/domain/repositories/home_repositories.dart';

class ServiceRepositoryImpl extends ServiceRepository {
  final ServiceRemoteDataSourceImpl _remoteDataSource;

  ServiceRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Service>> getServices() async {
    try {
      return await _remoteDataSource.getServices();
    } catch (e) {
      // Handle error
      throw Exception('Failed to fetch services: $e');
    }
  }
}
