//
//  Spoke.m
//  CircleLayout
//
//  Created by Daniel Hedrick on 10/6/14.
//  Copyright (c) 2014 Olivier Gutknecht. All rights reserved.
//

#import "SpokeReusableView.h"
#import "SpokeAttributes.h"

@interface SpokeReusableView ()
@end

@implementation SpokeReusableView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.layer.borderWidth = 0.0;
        self.layer.borderColor = [UIColor clearColor].CGColor;

        UIView *subview = [[UIView alloc] init];
        CGRect subframe = CGRectMake(frame.size.width / 2.0, 0.0,
                                    frame.size.width / 2.0, frame.size.height);
        subview.frame = subframe;
        subview.layer.backgroundColor = subview.layer.borderColor = [UIColor blueColor].CGColor;
        subview.layer.borderWidth = 0.0f;
        [self addSubview:subview];
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
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@; startingPoint = %@; endingPoint = %@",
            [super description],
            NSStringFromCGPoint(self.startingPoint),
            NSStringFromCGPoint(self.endingPoint)];
}
@end
