#import "MiraPlugin.h"
#if __has_include(<mira/mira-Swift.h>)
#import <mira/mira-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mira-Swift.h"
#endif

@implementation MiraPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMiraPlugin registerWithRegistrar:registrar];
}
@end
