//
//  SpokeLayer.h
//  CircleLayout
//
//  Created by Daniel Hedrick on 10/7/14.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SpokeLayer : CAShapeLayer
- (id)initWithFrame:(CGRect)frame;
- (void)setStartingPoint:(CGPoint)start endingPoint:(CGPoint)end;
@end
