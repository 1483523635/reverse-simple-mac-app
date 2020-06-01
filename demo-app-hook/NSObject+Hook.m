//
//  NSObject+Hook.m
//  demo-app-hook
//
//  Created by Lianqing Qu  on 6/1/20.
//  Copyright © 2020 Lianqing Qu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "NSObject+Hook.h"


void DumpObjcMethods(Class clz, Method pMethod) {

    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(clz, &methodCount);

    printf("Found %d methods on '%s'\n", methodCount, class_getName(clz));

    for (unsigned int i = 0; i < methodCount; i++) {
        Method method = methods[i];

        printf("\t'%s' has method named '%s' of encoding '%s'\n",
                class_getName(clz),
                sel_getName(method_getName(method)),
                method_getTypeEncoding(method));
    }

    free(methods);
}


void hookMethod(Class originalClass, SEL originalSelector, Class swizzledClass, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(originalClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSelector);
    // DumpObjcMethods(originalClass, swizzledMethod);
    if (originalMethod && swizzledMethod) {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation NSObject (Hook)

+ (void)hook {

    hookMethod(objc_getClass("ViewController"), @selector(CancelClicked:), [self class], @selector(Hook_CancelClicked:));
    hookMethod(objc_getClass("AppendText"), @selector(Append:), [self class], @selector(hook_append:));

}

// this is demo for middleware
- (NSString *)hook_append:(NSString *)name {
    NSLog(@"hook method");
    return [self hook_append:name];
    return name;
}

- (IBAction)Hook_CancelClicked:(id)sender
{
    NSLog(@"hook clicked");
}

@end
