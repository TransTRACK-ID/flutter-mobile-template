import 'package:result_templte/models/base_response.dart';
import 'package:result_templte/services/api_services.dart';
import 'package:result_templte/utils/enums.dart';
import 'package:result_templte/utils/exceptions.dart';
import 'package:result_templte/utils/typedefs.dart';
import 'package:result_templte/utils/wrappers/response_wrapper.dart';

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
    ResponseOfRequest response, {
    Function(Object e)? onError,
  }) =>
      ResponseWrapper.guard(response, onError: onError);
}
