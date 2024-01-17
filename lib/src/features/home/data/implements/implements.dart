
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class HomeRepositoryImp implements HomeRepository{

        final HomeRemoteDataSource remoteDataSource;
        HomeRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    