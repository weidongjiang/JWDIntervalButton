//
//  UIButton+layoutButtonWithEdgeInsets.m
//  JWDIntervalButton
//
//  Created by yixiajwd on 2018/6/25.
//  Copyright © 2018年 yixiajwd. All rights reserved.
//

#import "UIButton+layoutButtonWithEdgeInsets.h"

@implementation UIButton (layoutButtonWithEdgeInsets)

- (void)jwd_layoutButtonWithEdgeInsetsStyle:(JWDButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space {

    CGFloat imageViewWidth = CGRectGetWidth(self.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);

    if (labelWidth == 0) {
        CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        labelWidth  = titleSize.width;
    }

    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    CGFloat imageInsetsBottom = 0.0f;
    CGFloat imageInsetsRight = 0.0f;

    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    CGFloat titleInsetsBottom = 0.0f;
    CGFloat titleInsetsRight = 0.0f;

    switch (style) {
        case JWDButtonEdgeInsetsStyleImageRight:
        {
            space = space * 0.5;

            imageInsetsLeft = labelWidth + space;
            imageInsetsRight = -imageInsetsLeft;

            titleInsetsLeft = - (imageViewWidth + space);
            titleInsetsRight = -titleInsetsLeft;
        }
            break;

        case JWDButtonEdgeInsetsStyleImageLeft:
        {
            space = space * 0.5;

            imageInsetsLeft = -space;
            imageInsetsRight = -imageInsetsLeft;

            titleInsetsLeft = space;
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case JWDButtonEdgeInsetsStyleImageBottom:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;

            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);

            CGFloat imageBottomY = CGRectGetMaxY(self.imageView.frame);
            CGFloat titleTopY = CGRectGetMinY(self.titleLabel.frame);

            imageInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - imageBottomY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;

            titleInsetsTop = (buttonHeight * 0.5 - boundsCentery) - titleTopY;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;

        }
            break;
        case JWDButtonEdgeInsetsStyleImageTop:
        {
            CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
            CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
            CGFloat buttonHeight = CGRectGetHeight(self.frame);
            CGFloat boundsCentery = (imageHeight + space + labelHeight) * 0.5;

            CGFloat centerX_button = CGRectGetMidX(self.bounds); // bounds
            CGFloat centerX_titleLabel = CGRectGetMidX(self.titleLabel.frame);
            CGFloat centerX_image = CGRectGetMidX(self.imageView.frame);

            CGFloat imageTopY = CGRectGetMinY(self.imageView.frame);
            CGFloat titleBottom = CGRectGetMaxY(self.titleLabel.frame);

            imageInsetsTop = (buttonHeight * 0.5 - boundsCentery) - imageTopY;
            imageInsetsLeft = centerX_button - centerX_image;
            imageInsetsRight = - imageInsetsLeft;
            imageInsetsBottom = - imageInsetsTop;

            titleInsetsTop = buttonHeight - (buttonHeight * 0.5 - boundsCentery) - titleBottom;
            titleInsetsLeft = -(centerX_titleLabel - centerX_button);
            titleInsetsRight = - titleInsetsLeft;
            titleInsetsBottom = - titleInsetsTop;
        }
            break;

        default:
            break;
    }

    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, imageInsetsBottom, imageInsetsRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetsTop, titleInsetsLeft, titleInsetsBottom, titleInsetsRight);
}

@end
