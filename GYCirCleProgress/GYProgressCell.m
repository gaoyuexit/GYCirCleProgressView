//
//  GYProgressCell.m
//  GYCirCleProgress
//
//  Created by ronmei on 16/7/26.
//  Copyright © 2016年 gaoyu. All rights reserved.
//

#import "GYProgressCell.h"
#import "GYCircleProgressView.h"

@interface GYProgressCell ()

@property (weak, nonatomic) IBOutlet GYCircleProgressView *circleProgressView;

@end

@implementation GYProgressCell

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self.circleProgressView setProgress:progress animated:YES];
}

@end
