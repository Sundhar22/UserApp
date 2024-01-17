
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class BookingRepositoryImp implements BookingRepository{

        final BookingRemoteDataSource remoteDataSource;
        BookingRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    