import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:supplier_snap/app/core/failures/failures.dart';
import 'package:supplier_snap/app/core/models/app_user.dart';
import 'package:supplier_snap/app/core/services/supbase_storage_service.dart';
import 'package:supplier_snap/app/modules/auth/data/repository/auth_repository.dart';
import 'package:supplier_snap/app/modules/profile/data/datasources/profile_local_datasource.dart';
import 'package:supplier_snap/app/modules/profile/data/datasources/profile_remote_datasource.dart';

class ProfileRepository extends BaseRepository {
  final ProfileLocalDatasource localSource;
  final ProfileRemoteDatasource remoteSource;
  final SupbaseStorageService supbaseStorageService;

  const ProfileRepository({
    required this.localSource,
    required this.remoteSource,
    required super.connectivityService,
    required this.supbaseStorageService,
  });

  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteSource.logOut();
      await localSource.clearUserData();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, AppUser>> getProfile() async {
    try {
      AppUser? appUser;
      if (!connectivityService.isOnline.value) {
        final cachedUser = await localSource.getAppUserData();
        if (cachedUser == null) {
          return Left(NoUserFound("No cached user data found"));
        }
        appUser = AppUser.fromJson(cachedUser);
      } else {
        final profileData = await remoteSource.getProfile();
        appUser = AppUser.fromMap(profileData);
        localSource.saveAppUserData(appUser.toJson());
      }
      return Right(appUser);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, AppUser>> updateProfile(AppUser appuser) async {
    try {
      if (!connectivityService.isOnline.value) {
        return Left(NetworkFailure(message: "No internet connection"));
      }
      await remoteSource.updateProfile(appuser.toMap());
      return Right(appuser);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, String>> uploadProfileImage(
    File imageFile,
    String userId,
  ) async {
    try {
      if (!connectivityService.isOnline.value) {
        return Left(NetworkFailure(message: "No internet connection"));
      }
      final imageUrl = await supbaseStorageService.uploadFile(
        file: imageFile,
        fileName: userId,
      );
      if (imageUrl == null) {
        return Left(CommonFailure("Image upload failed"));
      }
      return Right(imageUrl);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
