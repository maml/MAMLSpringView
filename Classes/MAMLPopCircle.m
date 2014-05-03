//
//  MAMLPopCircle.m
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//

#import "MAMLPopCircle.h"

@interface MAMLPopCircle ()

@property BOOL needToPopIn;
@property BOOL needToRemoveAnimation;
@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@property (nonatomic) UIColor  *offColor;
@property (nonatomic) UIColor  *onColor;

@end

@implementation MAMLPopCircle

@synthesize needToPopIn, needToRemoveAnimation, offColor, onColor, shapeLayer, state;

- (id)initWithFrame:(CGRect)frame OnColor:(UIColor *)_onColor OffColor:(UIColor *)_offColor;
{
    self = [super initWithFrame:frame];
    if (self) {
        onColor = _onColor;
        offColor = _offColor;
        
        // Sets up the circle with respect to the frame within which it's initialized
        shapeLayer = [CAShapeLayer layer];
        shapeLayer.strokeColor = [offColor CGColor];
        shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        
        CGFloat midX = CGRectGetMidX(self.bounds);
        CGFloat midY = CGRectGetMidY(self.bounds);
        CGPoint center = CGPointMake(midX, midY);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:self.bounds.size.width/2
                                                        startAngle:0
                                                          endAngle:(2 * M_PI)
                                                         clockwise:YES];
        [path closePath];
        shapeLayer.path = path.CGPath;
        [self.layer addSublayer:shapeLayer];
        
        needToPopIn = YES;
        needToRemoveAnimation = NO;
    }
    return self;
}

#pragma mark - Setter

- (void)setState:(BOOL)_state animated:(BOOL)animated
{
    switch (_state) {
        case CircleStateOn:
            shapeLayer.strokeColor = [onColor CGColor];
            if (animated) {
                [self popOut];
            }
            break;
            
        default:
            shapeLayer.strokeColor = [offColor CGColor];
            if (animated) {
                [self popOut];
            }
            break;
    }
}

#pragma mark POPAnimations

- (void)popOut
{
    POPSpringAnimation *animV = [POPSpringAnimation animation];
    animV.delegate = self;
    animV.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    animV.toValue = [NSValue valueWithCGSize:CGSizeMake(1.4, 1.4)];
    animV.springSpeed = 20.0;
    [self pop_addAnimation:animV forKey:@"view"];
}

- (void)popIn
{
    POPSpringAnimation *animV = [POPSpringAnimation animation];
    animV.delegate = self;
    animV.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    animV.toValue = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    animV.springBounciness = 10.0;
    animV.springSpeed = 13.0;
    [self pop_addAnimation:animV forKey:@"view"];
    needToPopIn = NO;
}

#pragma mark POPAnimationDelegate

- (void)pop_animationDidReachToValue:(POPAnimation *)anim
{
    if (needToRemoveAnimation) {
        [self pop_removeAnimationForKey:@"view"];
        needToRemoveAnimation = NO;
    }
    if (needToPopIn) {
        [self popIn];
    }
}

- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished
{
    if (finished) {
        needToPopIn = YES;
        needToRemoveAnimation = YES;
    }
}


@end
