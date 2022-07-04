import 'package:result_templte/models/base_response.dart';
import 'package:result_templte/repositories/base_repository.dart';
import 'package:result_templte/utils/constants.dart';

class ExampleRepository extends BaseRepository {
  Future<BaseResponse<List>> getExamples(String key) async {
    final response = await get(
      ApiEndPoint.kApiExample,
      queryParameters: <String, String>{
        'search_columns': 'name',
        'search_key': key,
        'page': '-1',
      },
    );

    final result = responseWrapper<List>(response);
   
    return BaseResponse.success(result);
  }
}
