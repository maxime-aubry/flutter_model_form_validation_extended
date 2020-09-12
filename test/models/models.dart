import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation_extended/flutter_model_form_validation_extended.dart';

void main() {}

//#region Color
@flutterModelFormValidator
class ColorTest {
  ColorTest(this.value, this.colorType);

  @Color(
    colorTypeOnProperty: 'colorType',
    error: 'Invalid color',
  )
  final String value;
  final ColorType colorType;
}

@flutterModelFormValidator
class ColorWithUserAndDeveloperValuesTest {
  ColorWithUserAndDeveloperValuesTest(this.value, this.colorType);

  @Color(
    colorTypeOnProperty: 'colorType',
    colorType: ColorType.hex,
    error: 'Invalid color',
  )
  final String value;
  final ColorType colorType;
}

@flutterModelFormValidator
class ColorWithUserValuesTest {
  ColorWithUserValuesTest(this.value, this.colorType);

  @Color(
    colorTypeOnProperty: 'colorType',
    error: 'This String is not in the range',
  )
  final String value;
  final ColorType colorType;
}

@flutterModelFormValidator
class ColorWithDeveloperValuesTest {
  ColorWithDeveloperValuesTest(this.value);

  @Color(
    colorType: ColorType.hex,
    error: 'This String is not in the range',
  )
  final String value;
}
//#endregion

//#region GPS
@flutterModelFormValidator
class GPSTest {
  GPSTest(this.latitude, this.gpsPartOnLatitude, this.gpsFormatOnLatitude,
      this.longitude, this.gpsPartOnLongitude, this.gpsFormatOnLongitude);

  @GPS(
    gpsPartOnProperty: 'gpsPartOnLatitude',
    gpsFormatOnProperty: 'gpsFormatOnLatitude',
    gpsPart: GpsPart.latitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS latitude',
  )
  final String latitude;
  final GpsPart gpsPartOnLatitude;
  final GpsFormat gpsFormatOnLatitude;

  @GPS(
    gpsPartOnProperty: 'gpsPartOnLongitude',
    gpsFormatOnProperty: 'gpsFormatOnLongitude',
    gpsPart: GpsPart.longitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS longitude',
  )
  final String longitude;
  final GpsPart gpsPartOnLongitude;
  final GpsFormat gpsFormatOnLongitude;
}

@flutterModelFormValidator
class GPSWithUserAndDeveloperValuesTest {
  GPSWithUserAndDeveloperValuesTest(
      this.latitude,
      this.gpsPartOnLatitude,
      this.gpsFormatOnLatitude,
      this.longitude,
      this.gpsPartOnLongitude,
      this.gpsFormatOnLongitude);

  @GPS(
    gpsPartOnProperty: 'gpsPartOnLatitude',
    gpsFormatOnProperty: 'gpsFormatOnLatitude',
    gpsPart: GpsPart.latitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS latitude',
  )
  final String latitude;
  final GpsPart gpsPartOnLatitude;
  final GpsFormat gpsFormatOnLatitude;

  @GPS(
    gpsPartOnProperty: 'gpsPartOnLongitude',
    gpsFormatOnProperty: 'gpsFormatOnLongitude',
    gpsPart: GpsPart.longitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS longitude',
  )
  final String longitude;
  final GpsPart gpsPartOnLongitude;
  final GpsFormat gpsFormatOnLongitude;
}

@flutterModelFormValidator
class GPSWithUserValuesTest {
  GPSWithUserValuesTest(
      this.latitude,
      this.gpsPartOnLatitude,
      this.gpsFormatOnLatitude,
      this.longitude,
      this.gpsPartOnLongitude,
      this.gpsFormatOnLongitude);

  @GPS(
    gpsPartOnProperty: 'gpsPartOnLatitude',
    gpsFormatOnProperty: 'gpsFormatOnLatitude',
    gpsPart: GpsPart.latitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS latitude',
  )
  final String latitude;
  final GpsPart gpsPartOnLatitude;
  final GpsFormat gpsFormatOnLatitude;

  @GPS(
    gpsPartOnProperty: 'gpsPartOnLongitude',
    gpsFormatOnProperty: 'gpsFormatOnLongitude',
    gpsPart: GpsPart.longitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS longitude',
  )
  final String longitude;
  final GpsPart gpsPartOnLongitude;
  final GpsFormat gpsFormatOnLongitude;
}

@flutterModelFormValidator
class GPSWithDeveloperValuesTest {
  GPSWithDeveloperValuesTest(this.latitude, this.longitude);

  @GPS(
    gpsPart: GpsPart.latitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS latitude',
  )
  final String latitude;

  @GPS(
    gpsPart: GpsPart.longitude,
    gpsFormat: GpsFormat.dd,
    error: 'Invalid GPS longitude',
  )
  final String longitude;
}
//#endregion
