import 'package:flutter_test/flutter_test.dart';
import 'package:workbook/core/models/domain/scheme/cfield.dart';

void main() {
  testTextFieldWithLength();
  testTextFieldNoLength();
  testLanguageLevelField();
}

void testTextFieldWithLength() {
  test('when TextCField with length :: maxLength != null', () {
    // -- prepare test data --
    const key = 'Test key';
    const label = 'Test field';
    const value = 'Test value';
    const maxLength = 70;

    // -- do test actions --
    const fieldScheme = TextCFieldScheme(
      key: key, 
      label: label,
      maxLength: maxLength,
    );
    final field = TextCField(
      scheme: fieldScheme, 
      value: value,
    );

    // -- check values --
    expect(field.scheme.label, label);
    expect(field.value, value);
    expect(field.scheme.maxLength, maxLength);
  });
}

void testTextFieldNoLength() {
  test('when TextCField without length :: maxLength = null', () {
    // -- prepare test data --
    const key = 'Test key';
    const label = 'Test field';
    const value = 'Test value';

    // -- do test actions --
    const fieldScheme = TextCFieldScheme(
      key: key, 
      label: label,
    );
    final field = TextCField(
      scheme: fieldScheme, 
      value: value,
    );

    // -- check values --
    expect(field.scheme.label, label);
    expect(field.value, value);
    expect(field.scheme.maxLength, null);
  });
}

void testLanguageLevelField() {
  test('test comparing language levels in LanguageLevelField', () {
    // -- prepare test data --
    const key = 'Test key';
    const label = 'Test field';
    const a0 = 'A0';
    const a1 = 'A1';
    const a2 = 'A2';
    const b1 = 'B1';
    const c2 = 'C2';

    // -- do test actions --
    const fieldScheme = LanguageLevelFieldScheme (
      key: key,
      label: label,
    );
    final levelA0 = LanguageLevelField(scheme: fieldScheme, valueStr: a0);
    final levelA1 = LanguageLevelField(scheme: fieldScheme, valueStr: a1);
    final levelA2 = LanguageLevelField(scheme: fieldScheme, valueStr: a2);
    final levelB1 = LanguageLevelField(scheme: fieldScheme, valueStr: b1);
    final levelC2 = LanguageLevelField(scheme: fieldScheme, valueStr: c2);

    // -- check values --
    expect(levelA0 < levelA1, true);
    expect(levelA0 > levelA1, false);

    expect(levelA1 < levelA2, true);
    expect(levelA1 > levelA2, false);

    expect(levelA2 < levelB1, true);
    expect(levelA2 > levelB1, false);

    expect(levelA2 < levelB1, true);
    expect(levelA2 > levelB1, false);

    expect(levelB1 < levelC2, true);
    expect(levelB1 > levelC2, false);

    expect(levelA2 < levelC2, true);
    expect(levelA2 > levelC2, false);

    expect(levelA2 < levelA2, false);
    expect(levelA2 > levelA2, false);
  });
}
