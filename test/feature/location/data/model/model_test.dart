import 'package:flutter_test/flutter_test.dart';
import 'package:user_app/src/features/location/data/models/models.dart';
import 'package:user_app/src/features/location/domain/entities/entities.dart';

void main() {
  final tLocationModel = LocationModel(status: 'success');

  test('Model is subclass of entity', () async {
    expect(tLocationModel, isA<LocationEntity>());
  });

  //  json test from source to model test is not needed

  // same as above model to json test is not needed
    
}
