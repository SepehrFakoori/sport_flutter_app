import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/update_profile.dart';
import 'package:sport_flutter_app/features/profile/domain/exceptions/profile_exceptions.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';

class CompleteProfileUseCase {
  final ProfileRepository _repository;

  const CompleteProfileUseCase(this._repository);

  void validateFirstName(String firstName) {
    if (firstName.isEmpty) {
      throw EmptyFieldException();
    }
    if (firstName.length < 3 && firstName.isNotEmpty) {
      throw InvalidFirstNameException();
    }
  }

  void validateLastName(String lastName) {
    if (lastName.isEmpty) {
      throw EmptyFieldException();
    }
    if (lastName.length < 3 && lastName.isNotEmpty) {
      throw InvalidLastNameException();
    }
  }

  void validateEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );

    final bool hasMatch = emailRegex.hasMatch(email);

    if (email.isNotEmpty && !hasMatch) {
      throw InvalidEmailException();
    }
  }

  Future<Result<void>> call(UpdateProfile profile) =>
      _repository.updateProfile(profile);
}
