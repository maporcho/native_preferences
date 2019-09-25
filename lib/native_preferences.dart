import 'dart:async';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:meta/meta.dart';
import 'package:native_preferences/native_key.dart';

const _kChannel = const MethodChannel('native_preferences');

class NativePreferences {
  String androidPreferenceName;
  String iosPreferenceName;
  Map<dynamic, NativeKey> keySet;

  TargetPlatform _platform;
  String _preferenceName;

  NativePreferences() {
    if (Platform.isAndroid) {
      _platform = TargetPlatform.android;
      _preferenceName = androidPreferenceName;
    } else if (Platform.isIOS) {
      _platform = TargetPlatform.iOS;
      _preferenceName = iosPreferenceName;
    } else {
      throw ("Unknown platform");
    }
  }

  getString(dynamic key) async {
    String response = "";
    response = await _kChannel.invokeMethod('getString',
        {'preferenceName': _preferenceName, 'key': keySet[key].get(_platform)});
    return response;
  }

  getBool(dynamic key) async {
    bool response;
    response = await _kChannel.invokeMethod('getBool',
        {'preferenceName': _preferenceName, 'key': keySet[key].get(_platform)});
    return response;
  }

  getInt(dynamic key) async {
    int response;
    response = await _kChannel.invokeMethod('getInt',
        {'preferenceName': _preferenceName, 'key': keySet[key].get(_platform)});
    return response;
  }

  getDouble(dynamic key) async {
    double response;
    response = await _kChannel.invokeMethod('getDouble',
        {'preferenceName': _preferenceName, 'key': keySet[key].get(_platform)});
    return response;
  }

  get(dynamic key) async {
    var response = await _kChannel.invokeMethod('get',
        {'preferenceName': _preferenceName, 'key': keySet[key].get(_platform)});
    return response;
  }
}
