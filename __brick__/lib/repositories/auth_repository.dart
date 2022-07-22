import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:{{app_name}}/helpers/flash_message_helper.dart';
import 'package:{{app_name}}/models/base_response.dart';
import 'package:{{app_name}}/models/user.dart';
import 'package:{{app_name}}/repositories/base_repository.dart';
import 'package:{{app_name}}/services/hive_service.dart';
import 'package:{{app_name}}/utils/constants.dart';
import 'package:{{app_name}}/utils/enums.dart';
import 'package:{{app_name}}/utils/exceptions.dart';
import 'package:{{app_name}}/utils/typedefs.dart';

class AuthRepository extends BaseRepository {
  Future<BaseResponse<User>> submitLogin(
    String email,
    String password,
  ) async {
    final response = await post(
      ApiEndPoint.kApiExample,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.status == ResponseStatus.success) {
      final data = response.data! as MapString;
      final rawData = data['data'] as MapString;

      final user = User.fromJson(rawData);
      GetIt.I<HiveService>().storeUser(user);

      final storage = GetIt.I<FlutterSecureStorage>();

      await storage.write(key: kAccessToken, value: user.token);

      return BaseResponse.success(user);
    }
    throw CustomExceptionString(response.message ?? 'Unknown error');
  }
}
