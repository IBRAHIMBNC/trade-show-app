import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supplier_snap/app/core/failures/failures.dart';
import 'package:supplier_snap/app/core/models/app_user.dart';
import 'package:supplier_snap/app/core/services/connectivity_service.dart';
import 'package:supplier_snap/app/modules/auth/data/datasources/auth_local_datasource.dart';
import 'package:supplier_snap/app/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:supplier_snap/app/utils/error_helper.dart';

class AuthRepository extends BaseRepository {
  final AuthRemoteDatasource remoteSource;
  final AuthLocalDatasource localSource;

  const AuthRepository({
    required this.remoteSource,
    required this.localSource,
    required super.connectivityService,
  });

  Future<Either<Failure, AppUser>> signUp(
    String email,
    String password,
    Map<String, dynamic> metaData,
  ) async {
    try {
      if (!connectivityService.isOnline.value) {
        return Left(NetworkFailure(message: "No internet connection"));
      }
      final response = await remoteSource.signUp(email, password, metaData);
      final appUser = AppUser.fromAuthResponse(response);
      localSource.cacheUser(appUser);
      if (response.user == null) {
        return Left(NoUserFound("No user found after sign up"));
      }
      return Right(appUser);
    } on AuthApiException catch (e) {
      return _handleAuthException(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, AppUser>> signIn(String email, String password) async {
    try {
      if (!connectivityService.isOnline.value) {
        return Left(NetworkFailure(message: "No internet connection"));
      }
      final response = await remoteSource.signIn(email, password);
      AppUser appUser = await remoteSource.getUserProfile(response.user!.id);
      localSource.cacheUser(appUser);
      if (response.user == null) {
        return Left(NoUserFound("No user found after sign in"));
      }
      return Right(appUser);
    } on AuthApiException catch (e) {
      return _handleAuthException(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Helper method to handle AuthApiException errors
  Either<Failure, AppUser> _handleAuthException(AuthApiException error) {
    final message = ErrorHelper.getErrorMessage(error.code);
    return Left(ServerFailure(message.toString()));
  }

  Future<AppUser?> getUserProfile() async {
    if (!connectivityService.isOnline.value) {
      return localSource.getCachedUser();
    }
    final result = await localSource.getCachedUser();
    return result;
  }
}

class BaseRepository {
  final ConnectivityService connectivityService;

  const BaseRepository({required this.connectivityService});
}
