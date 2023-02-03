import 'package:{{app_name}}/models/base_response.dart';
import 'package:{{app_name}}/utils/enums.dart';
import 'package:{{app_name}}/utils/exceptions.dart';
import 'package:{{app_name}}/utils/typedefs.dart';

class ResponseWrapper {
  static T guard<T>(
    ResponseOfRequest<dynamic> response, {
    void Function(Object e)? onError,
  }) {
    assert(T == MapString || T == List, 'T must be MapString or List');

    try {
      if (response.status == ResponseStatus.success) {
        final data = response.data! as MapString;
        final raw = data['data'] as T;

        return raw;
      }
      throw CustomExceptionString(response.message ?? 'Unknown error');
    } catch (e) {
      onError?.call(e);
      rethrow;
    }
  }
}

