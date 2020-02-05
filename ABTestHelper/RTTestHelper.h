//
//  RTTestHelper.h
//  ABTestHelper
//
//  Created by mosquitoo on 2020/2/5.
//  Copyright © 2020 Thea. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RTTestHelper : NSObject


/// run an a/b test randomly assigned to execute 'a' or 'b'
/// @param name A unique identifiler for the test
/// @param a a block
/// /// @param b b block
+ (void)abTestWithName:(NSString *)name a:(dispatch_block_t)a b:(dispatch_block_t)b;

+ (void)splitTestWithName:(NSString *)name conditions:(NSArray<NSString *> *)conditions block:(void (^)(NSString *condition))block;

+ (void)updateTestName:(NSString *)name condition:(NSString *)condition;

@end

NS_ASSUME_NONNULL_END
