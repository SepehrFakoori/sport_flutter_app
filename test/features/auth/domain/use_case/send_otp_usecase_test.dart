import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sport_flutter_app/features/auth/domain/exceptions/auth_exceptions.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:sport_flutter_app/features/auth/domain/use_case/send_otp_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SendOtpUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = SendOtpUseCase(mockRepository);
  });

  group('Test phone number validation', () {
    test('Phone should start with 0 => throws InvalidPhonePrefixException', () {
      expect(
        () => useCase.validate('9301914321'),
        throwsA(isA<InvalidPhonePrefixException>()),
      );
    });

    test('Phone should has 11 length => throws InvalidPhoneLengthException', () {
      expect(
        () => useCase.validate('093019143211'),
        throwsA(isA<InvalidPhoneLengthException>()),
      );
    });
  });
}
