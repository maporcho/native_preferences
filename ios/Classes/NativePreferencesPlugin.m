#import "NativePreferencesPlugin.h"
#import <native_preferences/native_preferences-Swift.h>

@implementation NativePreferencesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativePreferencesPlugin registerWithRegistrar:registrar];
}
@end
