
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class OrderRepositoryImp implements OrderRepository{

        final OrderRemoteDataSource remoteDataSource;
        OrderRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    