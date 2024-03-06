class DBException implements Exception {}
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
class LocationDeniedException implements Exception {}
class LocationPermanentDeniedException implements Exception {}

class LocationDisableException implements Exception {}

class InvalidException implements Exception {}
class OtpInvalidException implements Exception {}

class DetailUpdateException implements Exception {}