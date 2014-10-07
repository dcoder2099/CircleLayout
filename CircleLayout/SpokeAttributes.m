//
//  SpokeAttributes.m
//  CircleLayout
//
//  Created by Daniel Hedrick on 10/6/14.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import "SpokeAttributes.h"

@implementation SpokeAttributes
- (id)init {
    if (self = [super init]) {
        _origin = CGPointZero;
        _endpoint = CGPointZero;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    SpokeAttributes *copy = [super copyWithZone:zone];
    copy.origin = self.origin;
    copy.endpoint = self.endpoint;
    return copy;
}

- (BOOL)isEqual:(id)other {
    if (other == self) {
        return YES;
    }
    if (!other || ![[other class] isEqual:[self class]]) {
        return NO;
    }
    SpokeAttributes *object = (SpokeAttributes *)other;
    if (!CGPointEqualToPoint(object.origin, self.origin)) {
        return NO;
    }
    if (!CGPointEqualToPoint(object.endpoint, self.endpoint)) {
        return NO;
    }
    return [super isEqual:other];
}

- (NSUInteger)hash {
    NSUInteger result = [super hash];
    result ^= (int)floor(self.origin.x);
    result ^= (int)floor(self.origin.y);
    result ^= (int)floor(self.endpoint.x);
    result ^= (int)floor(self.endpoint.y);
    return result;
}

@end
