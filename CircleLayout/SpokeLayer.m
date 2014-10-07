//
//  SpokeLayer.m
//  CircleLayout
//
//  Created by Daniel Hedrick on 10/7/14.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import "SpokeLayer.h"

@interface SpokeLayer ()
@property (nonatomic, strong) CAShapeLayer *spoke;
@end

@implementation SpokeLayer

- (id)initWithFrame:(CGRect)frame {
    if (self = [super init]) {
        self.bounds = frame;
        self.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        self.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        self.fillColor = [UIColor clearColor].CGColor;
        self.strokeColor = [UIColor greenColor].CGColor;
        self.lineWidth = 4;

        CAShapeLayer *spoke = [CAShapeLayer layer];
        spoke.lineWidth = 10.0;
        spoke.lineCap = @"round";
        spoke.strokeColor = [UIColor blueColor].CGColor;
        spoke.fillColor = [UIColor redColor].CGColor;
        spoke.position = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);

        self.spoke = spoke;
        [self addSublayer:self.spoke];
    }
    return self;
}

- (void)setStartingPoint:(CGPoint)start endingPoint:(CGPoint)end {
    CGPoint xlatedStart = [self convertPoint:start toLayer:self.spoke];
    CGPoint xlatedEnd = [self convertPoint:end toLayer:self.spoke];

    UIBezierPath *bp = [UIBezierPath bezierPath];
    [bp moveToPoint:xlatedStart];
    [bp addLineToPoint:xlatedEnd];

    self.spoke.path = bp.CGPath;
}

@end
