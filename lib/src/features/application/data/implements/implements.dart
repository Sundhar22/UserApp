
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class ApplicationRepositoryImp implements ApplicationRepository{

        final ApplicationRemoteDataSource remoteDataSource;
        ApplicationRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    