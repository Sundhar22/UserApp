library error;

class Failure {
  final String message;

  const Failure(this.message);
}

class DetailUpdateFailure extends Failure {
  DetailUpdateFailure(super.message);
}
class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class VerifyPhNumFailure extends Failure {
  VerifyPhNumFailure(super.message);
}

class OtpFailure extends Failure {
  OtpFailure(super.message);
}

class LocationPermissionFailure extends Failure {
  LocationPermissionFailure(super.message);
}

class LocationUpDateFailure extends Failure {
  LocationUpDateFailure(super.message);
}
