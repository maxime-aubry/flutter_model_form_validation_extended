import 'models/models.dart';
import 'models/models.reflectable.dart';
import 'package:flutter_model_form_validation/flutter_model_form_validation.dart';
import 'package:flutter_model_form_validation_extended/flutter_model_form_validation_extended.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  initializeReflectable();

  group('GPS.', () {
    group('Test the priority between user and developer static data.', () {
      test(
          '"gpsPart" and "gpsFormat" are provided by user and developer. User data has priority.',
          () {
        GPSWithUserAndDeveloperValuesTest tester =
            new GPSWithUserAndDeveloperValuesTest(
          'N48°51.498',
          GpsPart.latitude,
          GpsFormat.dm,
          'E2°17.67',
          GpsPart.longitude,
          GpsFormat.dm,
        );
        bool isValid =
            ModelState.isValid<GPSWithUserAndDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"gpsPart" and "gpsFormat" are provided by user only.', () {
        GPSWithUserValuesTest tester = new GPSWithUserValuesTest(
          'N48°51.498',
          GpsPart.latitude,
          GpsFormat.dm,
          'E2°17.67',
          GpsPart.longitude,
          GpsFormat.dm,
        );
        bool isValid = ModelState.isValid<GPSWithUserValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('"gpsPart" and "gpsFormat" are provided by developer only.', () {
        GPSWithDeveloperValuesTest tester =
            new GPSWithDeveloperValuesTest('48.8583', '2.2945');
        bool isValid = ModelState.isValid<GPSWithDeveloperValuesTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > success.', () {
      test('48.8583 and 2.2945 are valid GPS coordinates with DD format.', () {
        GPSTest tester = new GPSTest(
          '48.8583',
          GpsPart.latitude,
          GpsFormat.dd,
          '2.2945',
          GpsPart.longitude,
          GpsFormat.dd,
        );
        bool isValid = ModelState.isValid<GPSTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test('N48°51.498 and E2°17.67 are valid GPS coordinates with DM format.',
          () {
        GPSTest tester = new GPSTest(
          'N48°51.498',
          GpsPart.latitude,
          GpsFormat.dm,
          'E2°17.67',
          GpsPart.longitude,
          GpsFormat.dm,
        );
        bool isValid = ModelState.isValid<GPSTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });

      test(
          'N48°51\'29.88" and E2°17\'40.2" are valid GPS coordinates with DMS format.',
          () {
        GPSTest tester = new GPSTest(
          'N48°51\'29.88"',
          GpsPart.latitude,
          GpsFormat.dms,
          'E2°17\'40.2"',
          GpsPart.longitude,
          GpsFormat.dms,
        );
        bool isValid = ModelState.isValid<GPSTest>(tester);
        expect(isValid, true);
        expect(ModelState.errors.isEmpty, true);
      });
    });

    group('Test the validation > failure.', () {
      test('-91.8583 and 181.2945 are invalid GPS coordinates with DD format.',
          () {
        GPSTest tester = new GPSTest(
          '-91.8583',
          GpsPart.latitude,
          GpsFormat.dd,
          '181.2945',
          GpsPart.longitude,
          GpsFormat.dd,
        );
        bool isValid = ModelState.isValid<GPSTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['latitude'].validatorType, GPS);
        expect(ModelState.errors['latitude'].propertyName, 'latitude');
        expect(ModelState.errors['latitude'].error, 'Invalid GPS latitude');
        expect(ModelState.errors['longitude'].validatorType, GPS);
        expect(ModelState.errors['longitude'].propertyName, 'longitude');
        expect(ModelState.errors['longitude'].error, 'Invalid GPS longitude');
      });

      test(
          'N91°51.498 and E2°62.67 are invalid GPS coordinates with DM format.',
          () {
        GPSTest tester = new GPSTest(
          'N91°51.498',
          GpsPart.latitude,
          GpsFormat.dm,
          'E2°62.67',
          GpsPart.longitude,
          GpsFormat.dm,
        );
        bool isValid = ModelState.isValid<GPSTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['latitude'].validatorType, GPS);
        expect(ModelState.errors['latitude'].propertyName, 'latitude');
        expect(ModelState.errors['latitude'].error, 'Invalid GPS latitude');
        expect(ModelState.errors['longitude'].validatorType, GPS);
        expect(ModelState.errors['longitude'].propertyName, 'longitude');
        expect(ModelState.errors['longitude'].error, 'Invalid GPS longitude');
      });

      test(
          'N48°60\'29.88" and E2°17\'101.2" are invalid GPS coordinates with DMS format.',
          () {
        GPSTest tester = new GPSTest(
          'N48°60\'29.88"',
          GpsPart.latitude,
          GpsFormat.dms,
          'E2°17\'101.2"',
          GpsPart.longitude,
          GpsFormat.dms,
        );
        bool isValid = ModelState.isValid<GPSTest>(tester);
        expect(isValid, false);
        expect(ModelState.errors['latitude'].validatorType, GPS);
        expect(ModelState.errors['latitude'].propertyName, 'latitude');
        expect(ModelState.errors['latitude'].error, 'Invalid GPS latitude');
        expect(ModelState.errors['longitude'].validatorType, GPS);
        expect(ModelState.errors['longitude'].propertyName, 'longitude');
        expect(ModelState.errors['longitude'].error, 'Invalid GPS longitude');
      });
    });
  });
}
