library error;

class DataFetchException implements Exception {
  final String message;

  const DataFetchException(this.message);
}

class Failure {
  final String message;

  const Failure(this.message);
}

class DataFetchFailure extends Failure {
  DataFetchFailure(super.message);
}

class DataUpdateFailure extends Failure {
  DataUpdateFailure(super.message);
}
