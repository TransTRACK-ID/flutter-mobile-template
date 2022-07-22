import 'package:result_test/utils/extensions/string_extension.dart';

extension EnumExtension on Enum {
  String get toStringValue {
    return name.capitalize;
  }
}
