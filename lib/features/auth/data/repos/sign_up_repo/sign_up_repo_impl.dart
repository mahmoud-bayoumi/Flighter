import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/api_service.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/auth/data/models/sign_up_model.dart';
import 'package:flighter/features/auth/data/repos/sign_up_repo/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  @override
  Future<Either<Failure, SignUpModel>> signUp(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword}) async {
    Dio dio = Dio();
    ApiService apiService = ApiService(dio);
    try {
      var response = await apiService.post(endPoint: 'register', data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
      });
      return right(SignUpModel.fromJson(response));
    } on DioException catch (e) {
      return left(Failure(e.response!.data['message']));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
