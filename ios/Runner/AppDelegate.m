#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDKUI.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    FlutterMethodChannel *channel = [FlutterMethodChannel
                                     methodChannelWithName:@"com.mob.flutter/sharesdk"
                                     binaryMessenger:controller];
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if ([call.method isEqualToString:@"share"])
            {
                NSMutableDictionary *params = @{}.mutableCopy;
                NSArray *args = call.arguments;
                [params SSDKSetupShareParamsByText:args.lastObject[@"text"] images:args.lastObject[@"images"] url:args.lastObject[@"url"] title:args.lastObject[@"title"] type:SSDKContentTypeAuto];
                [ShareSDK share:[args.firstObject integerValue]
                     parameters:params
                 onStateChanged:^(SSDKResponseState state,
                                  NSDictionary *userData,
                                  SSDKContentEntity *contentEntity,
                                  NSError *error) {
                     
                     NSMutableDictionary *dic = @{}.mutableCopy;
                     dic[@"state"] = @(state);
                     dic[@"userData"] = userData;
                     dic[@"contentEntity"] = contentEntity.dictionaryValue;
                     dic[@"error"] = error.userInfo;
                     if (result)
                     {
                         result(dic);
                     }
                 }];
            }
            if ([call.method isEqualToString:@"auth"])
            {
                NSArray *args = call.arguments;
                [ShareSDK authorize:[args.firstObject integerValue]
                           settings:[args.firstObject isKindOfClass:NSDictionary.class] ? args.firstObject:nil
                     onStateChanged:^(SSDKResponseState state,
                                      SSDKUser *user,
                                      NSError *error) {
                         
                         NSMutableDictionary *dic = @{}.mutableCopy;
                         dic[@"state"] = @(state);
                         dic[@"user"] = user.dictionaryValue;
                         dic[@"error"] = error.userInfo;
                         if (result)
                         {
                             result(dic);
                         }
                     }];
            }
            if ([call.method isEqualToString:@"showMenu"])
            {
                NSMutableDictionary *params = @{}.mutableCopy;
                NSArray *args = call.arguments;
                [params SSDKSetupShareParamsByText:args.lastObject[@"text"] images:args.lastObject[@"images"] url:args.lastObject[@"url"] title:args.lastObject[@"title"] type:SSDKContentTypeAuto];
                [ShareSDK showShareActionSheet:nil
                                   customItems:[args.firstObject isKindOfClass:NSArray.class]?args.firstObject:nil
                                   shareParams:params
                            sheetConfiguration:nil
                                onStateChanged:^(SSDKResponseState state,
                                                 SSDKPlatformType platformType,
                                                 NSDictionary *userData,
                                                 SSDKContentEntity *contentEntity,
                                                 NSError *error,
                                                 BOOL end) {
                                    NSMutableDictionary *dic = @{}.mutableCopy;
                                    dic[@"state"] = @(state);
                                    dic[@"userData"] = userData;
                                    dic[@"contentEntity"] = contentEntity.dictionaryValue;
                                    dic[@"error"] = error.userInfo;
                                    if (result)
                                    {
                                        result(dic);
                                    }
                                }];
            }
            if ([call.method isEqualToString:@"showEditor"])
            {
                NSMutableDictionary *params = @{}.mutableCopy;
                NSArray *args = call.arguments;
                [params SSDKSetupShareParamsByText:args.lastObject[@"text"] images:args.lastObject[@"images"] url:args.lastObject[@"url"] title:args.lastObject[@"title"] type:SSDKContentTypeAuto];
                [ShareSDK showShareEditor:[args.firstObject integerValue]
                           otherPlatforms:nil
                              shareParams:params
                      editorConfiguration:nil
                           onStateChanged:^(SSDKResponseState state,
                                            SSDKPlatformType platformType,
                                            NSDictionary *userData,
                                            SSDKContentEntity *contentEntity,
                                            NSError *error,
                                            BOOL end) {
                               
                               NSMutableDictionary *dic = @{}.mutableCopy;
                               dic[@"state"] = @(state);
                               dic[@"userData"] = userData;
                               dic[@"contentEntity"] = contentEntity.dictionaryValue;
                               dic[@"error"] = error.userInfo;
                               if (result)
                               {
                                   result(dic);
                               }
                           }];
            }
        });
        
    }];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
