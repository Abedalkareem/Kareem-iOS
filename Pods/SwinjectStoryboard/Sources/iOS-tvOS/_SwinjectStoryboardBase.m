//
//  _SwinjectStoryboardBase.m
//  Swinject
//
//  Created by Yoichi Tagaya on 8/2/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

#import "_SwinjectStoryboardBase.h"

@implementation _SwinjectStoryboardBase

+ (nonnull instancetype)_create:(nonnull NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil {
    return (id)[self storyboardWithName:name bundle:storyboardBundleOrNil];
}

@end
