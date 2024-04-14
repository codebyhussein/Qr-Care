import 'package:qr_care/features/login/data/datasources/login_local_data_source.dart';

import 'package:qr_care/features/login/data/datasources/login_remote_data_source.dart';

import 'package:qr_care/features/login/domain/entities/user_entity.dart';

import 'package:qr_care/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  const LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Stream<UserEntity> get user {
    return remoteDataSource.user.map((UserModel) {
      if (UserModel != null) {
        localDataSource.write(key: 'user', value: UserModel);
      } else {
        localDataSource.write(key: 'user', value: null);
      }

      return UserModel == null ? UserEntity.empty : UserModel.toJson();
    });
  }

  @override
  Future<UserEntity> signIn({
    required String id,
    required String password,
  }) async {
    final userModel = await remoteDataSource.signIn(
      id: id,
      password: password,
    );

    localDataSource.write(key: 'user', value: userModel);

    return userModel.toJson();
  }
}
