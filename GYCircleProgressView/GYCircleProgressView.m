//
//  GYCircleProgressView.m
//  GYCirCleProgress
//
//  Created by ronmei on 16/7/25.
//  Copyright © 2016年 gaoyu. All rights reserved.
//

#import "GYCircleProgressView.h"
@interface GYCircleProgressView ()

@property (nonatomic, strong) CAShapeLayer  *bgLayer;
@property (nonatomic, strong) CAShapeLayer  *ballLayer;
@property (nonatomic, strong) CAShapeLayer  *circleLayer;
@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, assign) float          up;
@property (nonatomic, assign) float          progress;
@end

@implementation GYCircleProgressView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    [self.layer addSublayer:self.bgLayer];
    [self.layer addSublayer:self.ballLayer];
    [self.layer addSublayer:self.circleLayer];
    [self addSubview:self.ratioLabel];
    self.duration = 0.75;
    self.circleLayer.strokeStart = 0;
}


- (void)awakeFromNib
{
    [self setupSubViews];
}



- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    self.circleLayer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    self.circleLayer.frame = self.bounds;
}


- (CAShapeLayer *)bgLayer
{
    if (!_bgLayer) {
        CAShapeLayer *bgLayer = [CAShapeLayer layer];
        bgLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        bgLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        bgLayer.fillColor = [UIColor whiteColor].CGColor;
        _bgLayer = bgLayer;
    }
    return _bgLayer;
}

- (CAShapeLayer *)ballLayer
{
    if (!_ballLayer) {
        _ballLayer = [CAShapeLayer layer];
        _ballLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-5, self.bounds.size.height*0.5, 10, 10)].CGPath;
        _ballLayer.fillColor = [UIColor blueColor].CGColor;
    }
    return _ballLayer;
}

- (CAShapeLayer *)circleLayer
{
    if (!_circleLayer) {
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        _circleLayer.strokeColor = [UIColor blueColor].CGColor;
        _circleLayer.fillColor = [UIColor clearColor].CGColor;
        _circleLayer.lineCap = @"round";
        _circleLayer.lineWidth = 4;
        _circleLayer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
    }
    return _circleLayer;
}

- (UILabel *)ratioLabel
{
    if (!_ratioLabel) {
        _ratioLabel = [[UILabel alloc] init];
        _ratioLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _ratioLabel;
}


- (void)setProgress:(float)progress animated:(BOOL)animated
{
    _progress = progress * 100;
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = @(0);
        animation.toValue = @(progress);
        animation.duration = self.duration;
        [self.circleLayer addAnimation:animation forKey:nil];
        self.circleLayer.strokeEnd = progress;
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
        [_link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }else{
        self.circleLayer.strokeEnd = progress;
        self.ratioLabel.text = [NSString stringWithFormat:@"%.1f%%", progress*100];
        [self.ratioLabel sizeToFit];
        self.ratioLabel.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
    }
}

- (void)update:(CADisplayLink *)link
{
    
    self.up += ((_progress/60.0)/self.duration);
    if (_up >= _progress) {
        [link invalidate];
        link = nil;
        _up = _progress;
        
    }
    self.ratioLabel.text = [NSString stringWithFormat:@"%.1f%%",_up];
    [self.ratioLabel sizeToFit];
    self.ratioLabel.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
}

#pragma -
- (void)setTrackColor:(UIColor *)trackColor
{
    self.bgLayer.strokeColor = trackColor.CGColor;
}
- (void)setTrackWidth:(CGFloat)trackWidth
{
    self.bgLayer.lineWidth = trackWidth;
}
- (void)setProgressBarColor:(UIColor *)progressBarColor
{
    self.circleLayer.strokeColor = progressBarColor.CGColor;
}
- (void)setProgressBarWidth:(CGFloat)progressBarWidth
{
    self.circleLayer.lineWidth = progressBarWidth;
}
- (void)setBallColor:(UIColor *)ballColor
{
    self.ballLayer.fillColor = ballColor.CGColor;
}
- (void)setBallDiameter:(CGFloat)ballDiameter
{
    self.ballLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-ballDiameter/2, self.bounds.size.height*0.5, ballDiameter, ballDiameter)].CGPath;
}







@end
