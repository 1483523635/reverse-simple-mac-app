//
//  NSObject+Hook.h
//  demo-app-hook
//
//  Created by Lianqing Qu  on 6/1/20.
//  Copyright © 2020 Lianqing Qu . All rights reserved.
//

#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Hook)
+(void) hook;
@end

NS_ASSUME_NONNULL_END
