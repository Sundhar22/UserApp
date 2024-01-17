import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_app/src/core/error/exception.dart';
import 'package:user_app/src/features/location/data/models/models.dart';
import 'package:user_app/src/features/location/data/sources/sources.dart';

import '../../../../helper/test_helper.mocks.dart';

void main() {
  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  var mockDocumentReference = MockDocumentReference<Map<String, dynamic>>();
  late LocationRemoteDataSourceImp locationRemoteDataSourceImp;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference<Map<String, dynamic>>();
    mockDocumentReference = MockDocumentReference();

    when(mockFirebaseFirestore.collection(any))
        .thenReturn(mockCollectionReference);
    when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);

    locationRemoteDataSourceImp = LocationRemoteDataSourceImp(
        docReference: mockFirebaseFirestore.collection('users').doc('1'));
  });

  const geoPoint = GeoPoint(0.0, 0.0);
  group('update geoLocation', () {
    // arrange
    test('get success', () async {
      when(mockDocumentReference.update(any)).thenAnswer((_) async {});

      // act
      var result = await locationRemoteDataSourceImp.upDateLocation(geoPoint);
      // assert
      expect(result, isA<LocationModel>());
      expect(result.status, equals('success'));
    });
    test('get error', () async {
      when(mockDocumentReference.update(any)).thenAnswer((_) async {
        throw DBException();
      });

      // act
      try {
        await locationRemoteDataSourceImp.upDateLocation(geoPoint);
        // This line will not be reached if an exception is thrown
        fail('Expected a DBException');
      } catch (e) {
        // assert
        expect(e, isA<DBException>());
      }

      // expect(result.status, equals('error'));
    });
  });
}
