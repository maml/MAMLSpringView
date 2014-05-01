//
//  MAMLPopContainerView.m
//  PopConsecutiveAnimationEx
//
//  Created by Matthew Loseke on 4/30/14.
//  Copyright (c) 2014 Matthew Loseke. All rights reserved.
//

#import "MAMLPopContainerView.h"

@interface MAMLPopContainerView ()

@property (strong, nonatomic) MAMLPopCircle *circle;
@property (strong, nonatomic) MAMLPopLabel  *label;
@property BOOL state;

@property (nonatomic) NSString *onText;
@property (nonatomic) NSString *offText;
@property (nonatomic) UIColor  *onColor;
@property (nonatomic) UIColor  *offColor;

@end

@implementation MAMLPopContainerView

@synthesize circle, delegate, label, offColor, offText, onColor, onText, state;

- (void)awakeFromNib
{
    state = ViewStateOff;
    circle = [[MAMLPopCircle alloc] initWithFrame:self.bounds OnColor:onColor OffColor:offColor];
    label  = [[MAMLPopLabel alloc] initWithFrame:self.bounds OnColor:onColor OffColor:offColor OnText:onText OffText:offText];
    [self addSubview:circle];
    [self addSubview:label];
}

- (void)turnOn
{
    if (!ViewStateOn) {
        [circle setState:CircleStateOn];
        [label setState:LabelStateOn];
        state = ViewStateOn;
    }
}

- (void)turnOff
{
    if (!ViewStateOff) {
        [circle setState:CircleStateOff];
        [label setState:LabelStateOff];
        state = ViewStateOff;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self toggleState];
}

- (void)toggleState
{
    if (state == ViewStateOff) {
        [circle setState:CircleStateOn];
        [label setState:LabelStateOn];
        state = ViewStateOn;
    } else {
        [circle setState:CircleStateOff];
        [label setState:LabelStateOff];
        state = ViewStateOff;
    }

    [delegate springViewStateDidChange:state];
}

@end

