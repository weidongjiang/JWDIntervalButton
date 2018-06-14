//
//  JWDTouchAreaButton.h
//  JWDIntervalButton
//
//  Created by yixiajwd on 2018/6/14.
//  Copyright © 2018年 yixiajwd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWDTouchAreaButton : UIButton

/**
 扩大 或 缩小点击区域 +缩小，-扩大
 */
@property(nonatomic, assign) UIEdgeInsets touchAreaEdgeInsets;

@end
