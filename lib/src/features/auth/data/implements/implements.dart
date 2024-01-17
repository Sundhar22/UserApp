
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class AuthRepositoryImp implements AuthRepository{

        final AuthRemoteDataSource remoteDataSource;
        AuthRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    