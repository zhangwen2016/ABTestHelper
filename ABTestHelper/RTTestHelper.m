//
//  RTTestHelper.m
//  ABTestHelper
//
//  Created by mosquitoo on 2020/2/5.
//  Copyright © 2020 Thea. All rights reserved.
//

#import "RTTestHelper.h"

@implementation RTTestHelper


+ (void)abTestWithName:(NSString *)name a:(dispatch_block_t)a b:(dispatch_block_t)b {
    [self splitTestWithName:name conditions:@[@"a", @"b"] block:^(NSString * _Nonnull condition) {
        if (a && [condition isEqualToString:@"a"]) {
            a();
        } else if (b && [condition isEqualToString:@"b"]) {
            b();
        }
    }];
}


+ (void)splitTestWithName:(NSString *)name conditions:(NSArray<NSString *> *)conditions block:(void (^)(NSString *condition))block {
    id condition = [[NSUserDefaults standardUserDefaults] objectForKey:[self rtTestHeplerUserDefaultKeyForTestName:name]];
    guard(condition && [condition isKindOfClass:[NSString class]] && ((NSString *)condition).length > 0) else{
        return;
    }
    block(condition);
}

+ (void)updateTestName:(NSString *)name condition:(NSString *)condition {
    guard(name.length > 0 && condition.length > 0) else{
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:condition forKey:[self rtTestHeplerUserDefaultKeyForTestName:name]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)rtTestHeplerUserDefaultKeyForTestName:(NSString *)testName {
    static NSString * const kSLUserDefaultsKeyFormat = @"RTTestHepler-%@";
    return [NSString stringWithFormat:kSLUserDefaultsKeyFormat, testName];
}

@end
