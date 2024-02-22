import 'package:flutter/widgets.dart' show FormFieldValidator;

class Validators {
  static FormFieldValidator<String> required(String errorMessage) {
    return (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> nameString(String errorMessage) {
    final alphabetRegex = RegExp(r'^[a-zA-Z\s]+$');
    return (value) {
      if (value == null || value.isEmpty) {
        return null;
      } else if (!alphabetRegex.hasMatch(value)) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> studentId(String errorMessage) {
    final numericRegex = RegExp(r'^[0-9]+$');
    return (value) {
      if (value == null || value.isEmpty) {
        return null;
      } else if (!numericRegex.hasMatch(value) || value.length != 11) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> email(String errorMessage) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return (value) {
      if (value == null || value.isEmpty) {
        return null;
      } else if (!emailRegex.hasMatch(value)) {
        return errorMessage;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
