import 'package:ala_pos/data/remote/auth_remote_source.dart';
import 'package:ala_pos/domain/models/auth/login_model.dart';
import 'package:ala_pos/domain/models/auth_model.dart';
import 'package:ala_pos/domain/models/user_model.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepository {
  AuthRemoteSource remoteSource;
  LocalStorage storage;
  AuthRepository({required this.remoteSource, required this.storage});

  Future<UserModel> get user async {
    var userLogin = await storage.getValueJson(Constant.userLogin);
    return UserModel.fromJson(userLogin);
  }

  Future<bool> signOut() async {
    try {
      await remoteSource.logout();
      // Clear local storage Token
      storage.clearAll(Constant.token);
      // Clear local storage User Data
      storage.clearAll(Constant.userLogin);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Either<FailureModel, AuthModel>> checkToken() async {
    try {
      if (await storage.getValue(Constant.token) == null) {
        return Right(AuthModel(loggedStatus: false));
      }
      var response = await remoteSource.checkToken();

      if (response.status == true) {
        return Right(
          AuthModel(
            loggedStatus: true,
            personalAccessToken: await storage.getValue(Constant.token),
            userModel: UserModel.fromJson(response.data),
          ),
        );
      }

      return Right(AuthModel(loggedStatus: false));
    } on DioError catch (e) {
      return Left(FailureModel.serverError(e.message));
    } catch (e) {
      return Left(FailureModel.internalError(e.toString()));
    }
  }

  Future<Either<FailureModel, LoginModel>> signIn(String username, String password) async {
    try {
      var deviceName = await DeviceInfo().deviceName;

      ApiResponse response = await remoteSource.login(username, password, deviceName);
      if (!response.status!) {
        return Left(FailureModel.serverError(response.message));
      }

      var userLogin = LoginModel.fromJson(response.data);
      // Save Token
      storage.setValue(Constant.token, userLogin.personalAccessToken);
      // Save data User
      storage.setValue(Constant.userLogin, userLogin.userModel.toJson());
      return Right(userLogin);
    } on DioError catch (e) {
      return Left(FailureModel.serverError(e.message));
    } catch (e) {
      // print(e);
      return Left(FailureModel.internalError(e.toString()));
    }
  }

  Future<Either<FailureModel, LoginModel>> signUp({required String username, required String password, required String phone}) async {
    try {
      var deviceInfo = await DeviceInfo().info;
      ApiResponse response = await remoteSource.register(
        username: username,
        password: password,
        phone: phone,
        deviceName: deviceInfo.model!,
      );

      if (!response.status!) {
        return Left(FailureModel.serverError(response.message));
      }

      var userLogin = LoginModel.fromJson(response.data);
      // Save Token
      storage.setValue(Constant.token, userLogin.personalAccessToken);
      // Save data User
      storage.setValue(Constant.userLogin, userLogin.userModel.toJson());
      return Right(userLogin);
    } on DioError catch (e) {
      return Left(FailureModel.serverError(e.message));
    } catch (e) {
      // print(e);
      return Left(FailureModel.internalError(e.toString()));
    }
  }
}
