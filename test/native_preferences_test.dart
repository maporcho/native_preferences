import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_preferences/native_preferences.dart';

void main() {
  const MethodChannel channel = MethodChannel('native_preferences');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NativePreferences.platformVersion, '42');
  });
}
