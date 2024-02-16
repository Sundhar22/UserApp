
    import '../../domain/repositories/repositories.dart';
import '../sources/sources.dart';
    
    class ProfileRepositoryImp implements ProfileRepository{

        final ProfileRemoteDataSource remoteDataSource;
        ProfileRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    