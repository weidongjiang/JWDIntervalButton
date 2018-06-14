//
//  JWDTouchAreaButton.m
//  JWDIntervalButton
//
//  Created by yixiajwd on 2018/6/14.
//  Copyright © 2018年 yixiajwd. All rights reserved.
//

#import "JWDTouchAreaButton.h"
#import <objc/runtime.h>


@implementation JWDTouchAreaButton

- (void)setTouchAreaEdgeInsets:(UIEdgeInsets)touchAreaEdgeInsets {
    objc_setAssociatedObject(self, @selector(touchAreaEdgeInsets), [NSValue valueWithUIEdgeInsets:touchAreaEdgeInsets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIEdgeInsets)touchAreaEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, _cmd);
    if (value) {
        return [value UIEdgeInsetsValue];
    }
    return UIEdgeInsetsZero;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {

    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.touchAreaEdgeInsets) || !self.isUserInteractionEnabled || self.hidden || !self.enabled || self.alpha <= 0.01) {
        return [super pointInside:point withEvent:event];
    }
    // 扩大或缩小点击区域
    CGRect relativeFrame = self.bounds;
    CGRect touchAreaRect = UIEdgeInsetsInsetRect(relativeFrame, self.touchAreaEdgeInsets);
    // 点击是否 在该区域上
    return CGRectContainsPoint(touchAreaRect, point);
}


@end
