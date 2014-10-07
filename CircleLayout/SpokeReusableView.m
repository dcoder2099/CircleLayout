//
//  Spoke.m
//  CircleLayout
//
//  Created by Daniel Hedrick on 10/6/14.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import "SpokeReusableView.h"
#import "SpokeLayer.h"
#import "SpokeAttributes.h"

@interface SpokeReusableView ()
@property (nonatomic, strong) SpokeLayer *strokeLayer;
@end

@implementation SpokeReusableView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.strokeLayer = [[SpokeLayer alloc] initWithFrame:frame];
        [self.layer addSublayer:self.strokeLayer];
    }
    return self;
}

//- (void)prepareForReuse {
//    self.startingPoint = CGPointZero;
//    self.endingPoint = CGPointZero;
//    [self setNeedsDisplay];
//}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    SpokeAttributes *attrs = (SpokeAttributes *)layoutAttributes;
    self.startingPoint = attrs.origin;
    self.endingPoint = attrs.endpoint;
    [self.strokeLayer setStartingPoint: self.startingPoint endingPoint: self.endingPoint];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@; startingPoint = %@; endingPoint = %@",
            [super description],
            NSStringFromCGPoint(self.startingPoint),
            NSStringFromCGPoint(self.endingPoint)];
}
@end
