import 'package:{{app_name}}/models/base_response.dart';
import 'package:{{app_name}}/services/api_services.dart';
import 'package:{{app_name}}/utils/enums.dart';
import 'package:{{app_name}}/utils/exceptions.dart';
import 'package:{{app_name}}/utils/typedefs.dart';
import 'package:{{app_name}}/utils/wrappers/response_wrapper.dart';

abstract class DataTableRepository<M> extends BaseRepository {
  Future<BaseResponse<List<M>>> getDatatable(
    String key,
    String filter,
    MapStringValue sorts,
    int perPage,
    int page,
  );

  Future<BaseResponse<MapString>> deleteDatatable(String id);
}

abstract class BaseRepository extends ApiServices {
  T responseWrapper<T>(
    ResponseOfRequest<dynamic> response, {
    void Function(Object e)? onError,
  }) =>
      ResponseWrapper.guard(response, onError: onError);
}
