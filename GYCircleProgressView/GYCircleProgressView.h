//
//  GYCircleProgressView.h
//  GYCirCleProgress
//
//  Created by ronmei on 16/7/25.
//  Copyright © 2016年 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GYCircleProgressView : UIView

/**
 *  @author 郜宇      QQ: 289978684
 *  GitHub: https://github.com/gaoyuexit/GYCirCleProgressView
 *  @param nonatomic 进度条,支持代码和XIB创建
 */


/**
 *  动画时长: 如果不设置,默认0.75s
 */
@property (nonatomic, assign) NSTimeInterval duration;

/**
 *  底部细线的颜色 如果不设置,默认亮灰
 */
@property (nonatomic, strong) UIColor       *trackColor;

/**
 *  底部细线的宽度
 */
@property (nonatomic, assign) CGFloat        trackWidth;

/**
 *  进度条颜色 如果不设置,默认蓝色
 */
@property (nonatomic, strong) UIColor       *progressBarColor;

/**
 *  进度条宽度 如果不设置,默认4
 */
@property (nonatomic, assign) CGFloat        progressBarWidth;

/**
 *  小球的颜色 如果不设置,默认为蓝色
 */
@property (nonatomic, strong) UIColor       *ballColor;

/**
 *  小球的直径 如果不设置,默认为10
 */
@property (nonatomic, assign) CGFloat        ballDiameter;
/**
 *  中间文字label: 用来设置字体,颜色等等..
 */
@property (nonatomic, strong) UILabel       *ratioLabel;

/**
 *  设置进度
 *
 *  @param progress 进度值
 *  @param animated 是否动画
 */
- (void)setProgress:(float)progress animated:(BOOL)animated;


@end
