library error;

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

class Failure {
  final String message;

  const Failure(this.message);
}

class CatchError extends Failure {
  CatchError(super.message);
  
}


