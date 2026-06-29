abstract class AuthExceptions implements Exception {}

class PhoneEmptyException implements AuthExceptions {}

class PhoneInvalidPrefixException implements AuthExceptions {}

class PhoneInvalidLengthException implements AuthExceptions {}
