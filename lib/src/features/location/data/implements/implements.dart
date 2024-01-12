
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class LocationRepositoryImp implements LocationRepository{

        final LocationRemoteDataSource remoteDataSource;
        LocationRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    