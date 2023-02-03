import 'package:result_test/models/base_response.dart';
import 'package:result_test/services/api_services.dart';
import 'package:result_test/utils/enums.dart';
import 'package:result_test/utils/exceptions.dart';
import 'package:result_test/utils/typedefs.dart';
import 'package:result_test/utils/wrappers/response_wrapper.dart';

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
