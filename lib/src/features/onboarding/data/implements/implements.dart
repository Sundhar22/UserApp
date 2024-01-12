
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class OnboardingRepositoryImp implements OnboardingRepository{

        final OnboardingRemoteDataSource remoteDataSource;
        OnboardingRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    