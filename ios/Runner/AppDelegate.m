#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <workmanager/WorkmanagerPlugin.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [WorkmanagerPlugin registerTaskWithIdentifier:@"task-identifier"];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    NSTimeInterval time = 60*15; // 配置最小间隙 15分钟
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:time];
    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
