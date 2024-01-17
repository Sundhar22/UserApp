
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class NotificationRepositoryImp implements NotificationRepository{

        final NotificationRemoteDataSource remoteDataSource;
        NotificationRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    