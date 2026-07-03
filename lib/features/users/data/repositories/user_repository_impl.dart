import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/core/error/failures.dart';
import 'package:flutter_base_project/core/network/api_error_mapper.dart';
import 'package:flutter_base_project/features/users/data/datasources/user_remote_data_source.dart';
import 'package:flutter_base_project/features/users/domain/entities/app_user.dart';
import 'package:flutter_base_project/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._remote);

  final UserRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<AppUser>>> getUsers({required int page}) {
    return guardApiCall(() async {
      final response = await _remote.getUsers(page);
      return response.data.map((model) => model.toEntity()).toList();
    });
  }
}
