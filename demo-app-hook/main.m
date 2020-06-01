//
//  main.m
//  demo-app-hook
//
//  Created by Lianqing Qu  on 6/1/20.
//  Copyright © 2020 Lianqing Qu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Hook.h"

static void __attribute__((constructor)) initialize(void) {
    NSLog(@"-------------hook method -------------");
    [NSObject hook];
}

