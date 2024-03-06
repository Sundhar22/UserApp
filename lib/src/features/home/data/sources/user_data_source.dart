import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data_models.dart';

abstract class UserDataSource {
  Future<UserDataModel> getUser();
}

class UserDataSourceImplementation implements UserDataSource {
  final FirebaseAuth auth;
  final CollectionReference userCollection;

  UserDataSourceImplementation(
      {required this.auth, required this.userCollection});
  @override
  Future<UserDataModel> getUser() async {
    try {
      final user = auth.currentUser;
      final userDoc = await userCollection.doc(user!.uid).get();
      return UserDataModel.fromJson(userDoc.data() as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
