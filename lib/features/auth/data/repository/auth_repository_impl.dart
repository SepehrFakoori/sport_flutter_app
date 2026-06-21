import 'package:sport_flutter_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:sport_flutter_app/features/auth/data/mapper/auth_mapper.dart';
import 'package:sport_flutter_app/features/auth/domain/entity/auth.dart';
import 'package:sport_flutter_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  const AuthRepositoryImpl(this._dataSource);

  @override
  Future<void> sendOtp(String phone) => _dataSource.sendOtp(phone);

  @override
  Future<Auth> verifyOtp(String phone, String code) async {
    final model = await _dataSource.verifyOtp(phone, code);

    return model.toEntity();
  }
}
