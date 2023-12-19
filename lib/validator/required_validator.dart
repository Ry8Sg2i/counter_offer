import 'package:counterofferv1/validator/validator.dart';
import 'package:counterofferv1/validator/strings.dart';

class RequiredValidator implements Validator<String?> {
  @override
  bool validate(String? value) {
    if (value == null) {
      return false;
    }

    return value.trim().isNotEmpty;
  }

  @override
  String getMessage() => Strings.requiredValidatorMessage;
}