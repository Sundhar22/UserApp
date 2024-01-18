library error;

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

class Failure {
  final String message;

  const Failure(this.message);
}

class LocationPermissionFailure extends Failure {
  LocationPermissionFailure(super.message);
}
class LocationUpDateFailure extends Failure {
  LocationUpDateFailure(super.message);
}
