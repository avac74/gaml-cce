class GamlCCEBaseException implements Exception {
  final String _message;

  String get message => _message;

  GamlCCEBaseException(String message) : _message = message;

  @override
  String toString() {
    return _message;
  }
}

class SinkNodeCannotCollectException extends GamlCCEBaseException {
  SinkNodeCannotCollectException(String message) : super(message);
}

class SourceNodeCannotReceive extends GamlCCEBaseException {
  SourceNodeCannotReceive(String message) : super(message);
}
