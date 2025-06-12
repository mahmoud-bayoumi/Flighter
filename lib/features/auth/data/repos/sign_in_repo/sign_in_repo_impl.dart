import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/repos/sign_in_repo/sign_in_repo.dart';
import '../../models/sign_in_model/sign_in_model.dart';

class SignInRepoImpl implements SignInRepo {
  final ApiService apiService;

  SignInRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, SignInModel>> signIn(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
          endPoint: 'login', data: {'email': email, 'password': password});

      if (data['message'] == "Email or Password is incorrect!") {
        return left(Failure(data['message']));
      }

      return right(SignInModel.fromJson(data));
    } on DioException catch (e) {
      return left(Failure(e.response!.data['message']));
    } catch (e) {
      return left(Failure('Server Error'));
    }
  }
}
