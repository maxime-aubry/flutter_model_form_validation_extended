import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation_extended/src/annotations/validators/color.dart';
import 'package:flutter_model_form_validation_extended/src/utils/enum.dart';

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
