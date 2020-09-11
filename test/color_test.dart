import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation_extended/src/annotations/validators/color.dart';
import 'package:flutter_model_form_validation_extended/src/utils/enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('Color.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"colorType" is provided by user and developer. User data has priority.',
          () {
        ColorWithUserAndDeveloperValuesTest tester =
            new ColorWithUserAndDeveloperValuesTest(
                'rgb(80, 168, 50)', ColorType.rgb);
        bool isValid =
            ModelState.isValid<ColorWithUserAndDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"colorType" is provided by user only.', () {
        ColorWithUserValuesTest tester =
            new ColorWithUserValuesTest('rgb(80, 168, 50)', ColorType.rgb);
        bool isValid = ModelState.isValid<ColorWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"colorType" is provided by developer only.', () {
        ColorWithDeveloperValuesTest tester =
            new ColorWithDeveloperValuesTest('#50a832');
        bool isValid = ModelState.isValid<ColorWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('Valid HEX color, #50a832.', () {
        ColorTest tester = new ColorTest('#50a832', ColorType.hex);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('Valid RGB color, rgb(80, 168, 50).', () {
        ColorTest tester = new ColorTest('rgb(80, 168, 50)', ColorType.rgb);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('Valid HSL color, hsl(105, 54%, 43%).', () {
        ColorTest tester = new ColorTest('hsl(105, 54%, 43%)', ColorType.hsl);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('Valid HWB color, hwb(105, 20%, 34%).', () {
        ColorTest tester = new ColorTest('hwb(105, 20%, 34%)', ColorType.hwb);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('Valid CMYK color, cmyk(52%, 0%, 70%, 34%).', () {
        ColorTest tester =
            new ColorTest('cmyk(52%, 0%, 70%, 34%)', ColorType.cmyk);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('Valid NCol color, Y75, 20%, 34%.', () {
        ColorTest tester = new ColorTest('Y75, 20%, 34%', ColorType.ncol);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('Invalid HEX color, 50g832.', () {
        ColorTest tester = new ColorTest('50g832', ColorType.hex);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['value'].validatorType, Color);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid color');
      });

      test('Invalid RGB color, rgb(256, 168, 50).', () {
        ColorTest tester = new ColorTest('rgb(256, 168, 50)', ColorType.rgb);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['value'].validatorType, Color);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid color');
      });

      test('Invalid HSL color, hsl(105, 101%, 43%).', () {
        ColorTest tester = new ColorTest('hsl(105, 101%, 43%)', ColorType.hsl);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['value'].validatorType, Color);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid color');
      });

      test('Invalid HWB color, hwb(105, 101%, 34%).', () {
        ColorTest tester = new ColorTest('hwb(105, 101%, 34%)', ColorType.hwb);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['value'].validatorType, Color);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid color');
      });

      test('Invalid CMYK color, cmyk(101%, 0%, 70%, 34%).', () {
        ColorTest tester =
            new ColorTest('cmyk(101%, 0%, 70%, 34%)', ColorType.cmyk);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['value'].validatorType, Color);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid color');
      });

      test('Invalid NCol color, Y100, 101%, 34%.', () {
        ColorTest tester = new ColorTest('Y100, 101%, 34%', ColorType.ncol);
        bool isValid = ModelState.isValid<ColorTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['value'].validatorType, Color);
        expect(ModelState.errors['value'].propertyName, 'value');
        expect(ModelState.errors['value'].error, 'Invalid color');
      });
    });
  });
}
