import 'package:flutter/foundation.dart';

class NativeKey {
  String androidKey;
  String iosKey;

  NativeKey({this.androidKey, this.iosKey});

  String get(TargetPlatform platform) {
    if (platform == TargetPlatform.android) {
      return androidKey;
    } else if (platform == TargetPlatform.iOS) {
      return iosKey;
    } else {
      throw ("Unknown platform");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NativeKey &&
          runtimeType == other.runtimeType &&
          androidKey == other.androidKey &&
          iosKey == other.iosKey;

  @override
  int get hashCode => androidKey.hashCode ^ iosKey.hashCode;
}
