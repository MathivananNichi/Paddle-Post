import 'package:dartz/dartz.dart';
import 'package:paddle_post/core/error/failures.dart';
import 'package:paddle_post/core/usecase/usecase.dart';
import 'package:paddle_post/features/auth/domain/repositories/auth_repository.dart';

/// Use case: sign the current user out.
///
/// Takes [NoParams] because it needs no input.
class LogoutUseCase implements UseCase<Unit, NoParams> {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) => _repository.logout();
}
