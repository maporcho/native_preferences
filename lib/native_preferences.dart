import 'dart:async';

import 'package:flutter/services.dart';

class NativePreferences {
  static const MethodChannel _channel =
      const MethodChannel('native_preferences');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
