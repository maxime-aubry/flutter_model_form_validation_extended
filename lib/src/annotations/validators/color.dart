import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation_extended/src/utils/enum.dart';
import 'package:flutter_model_form_validation_extended/src/utils/rules.dart';

/// [Color] validator permits you to check that a string value is a valid color.
/// {@category Metadata}
/// {@subCategory Validators}
class Color extends ValidationAnnotation<String> {
  const Color({
    this.colorType,
    this.colorTypeOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  /// [colorType] is the color type.
  final ColorType colorType;

  /// [valueToCompareOnProperty] is the name of targeted property that user uses to provide color type. This one has priority on [colorType].
  final String colorTypeOnProperty;

  /// [error] is the custom error to return in case of invalidation.
  final String error;

  @override
  bool isValid<TModel>(String value, TModel model) {
    try {
      ColorType _colorType =
          ValidationHelper.getLinkedProperty<TModel, ColorType>(
                  model, this.colorTypeOnProperty) ??
              this.colorType;

      if (_colorType == null) return false;

      bool isValid = _validate(value, _colorType);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, ColorType colorType) {
    RegExp regExp = new RegExp(Rules.color[colorType]);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
