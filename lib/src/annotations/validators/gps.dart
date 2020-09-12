import 'package:flutter/widgets.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation_extended/src/utils/enum.dart';
import 'package:flutter_model_form_validation_extended/src/utils/rules.dart';

/// [GPS] validator permits you to check that a string value is valid GPS coordinates (latitude or longitude).
/// {@category Metadata}
/// {@subCategory Validators}
class GPS extends ValidationAnnotation<String> {
  const GPS({
    this.gpsPart,
    this.gpsFormat,
    this.gpsPartOnProperty,
    this.gpsFormatOnProperty,
    @required this.error,
  }) : super(criticityLevel: 2, error: error);

  final GpsPart gpsPart;
  final GpsFormat gpsFormat;
  final String gpsPartOnProperty;
  final String gpsFormatOnProperty;
  final String error;

  @override
  bool isValid<TModel>(String value, TModel model) {
    try {
      GpsPart _gpsPart = ValidationHelper.getLinkedProperty<TModel, GpsPart>(
              model, this.gpsPartOnProperty) ??
          this.gpsPart;
      GpsFormat _gpsFormat =
          ValidationHelper.getLinkedProperty<TModel, GpsFormat>(
                  model, this.gpsFormatOnProperty) ??
              this.gpsFormat;

      if (_gpsPart == null || _gpsFormat == null) return false;

      bool isValid = _validate(value, _gpsPart, _gpsFormat);
      return isValid;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool _validate(String value, GpsPart gpsPartValue, GpsFormat gpsFormatValue) {
    if (gpsPartValue == GpsPart.latitude)
      return _validateLatitude(value, gpsFormatValue);
    if (gpsPartValue == GpsPart.longitude)
      return _validateLongitude(value, gpsFormatValue);
    return false;
  }

  bool _validateLatitude(String value, GpsFormat gpsFormatValue) {
    if (!Rules.latitude.containsKey(gpsFormatValue)) return false;

    RegExp regExp = new RegExp(Rules.latitude[gpsFormatValue]);
    if (regExp.hasMatch(value)) return true;
    return false;
  }

  bool _validateLongitude(String value, GpsFormat gpsFormatValue) {
    if (!Rules.longitude.containsKey(gpsFormatValue)) return false;

    RegExp regExp = new RegExp(Rules.longitude[gpsFormatValue]);
    if (regExp.hasMatch(value)) return true;
    return false;
  }
}
