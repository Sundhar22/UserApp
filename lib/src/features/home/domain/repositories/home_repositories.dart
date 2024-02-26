import 'package:user_app/src/features/home/domain/entities/home_entity.dart';

abstract class ServiceRepository {
  Future<List<Service>> getServices();
}
