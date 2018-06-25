//
//  UIButton+layoutButtonWithEdgeInsets.h
//  JWDIntervalButton
//
//  Created by yixiajwd on 2018/6/25.
//  Copyright © 2018年 yixiajwd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JWDButtonEdgeInsetsStyle) {
    JWDButtonEdgeInsetsStyleImageLeft,
    JWDButtonEdgeInsetsStyleImageRight,
    JWDButtonEdgeInsetsStyleImageTop,
    JWDButtonEdgeInsetsStyleImageBottom
};


@interface UIButton (layoutButtonWithEdgeInsets)

/**
 改变 button 里面的 文本和 图片的位置

 @param style JWDButtonEdgeInsetsStyle
 @param space 文本和图片之间的水平间距
 */
- (void)jwd_layoutButtonWithEdgeInsetsStyle:(JWDButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space;

@end
