//
//  JWDIntervalButton.m
//  JWDIntervalButton
//
//  Created by yixiajwd on 2018/6/13.
//  Copyright © 2018年 yixiajwd. All rights reserved.
//

#import "JWDIntervalButton.h"
#import <objc/runtime.h>

static NSTimeInterval defaultInterval = .5;

@interface JWDIntervalButton ()

/**
 是否可以点击，yes 不可以  No 可以
 */
@property (nonatomic, assign) BOOL isIgnoreEvent;

@end

@implementation JWDIntervalButton
+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        // 创建方法名
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(tempSendAction:to:forEvent:);

        // 获取对象方法
        Method methodA = class_getInstanceMethod(self, selA);
        Method methodB = class_getInstanceMethod(self, selB);

        //将 methodB的实现 添加到系统方法中 即 将 methodA方法指针添加成 方法methodB的  返回值表示是否添加成功
        BOOL isAddMethodB = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        if (isAddMethodB) {
            // 添加成功了 说明 本类中不存在methodB
            // 此时必须将方法b的实现指针换成方法A的，否则 b方法将没有实现。
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
        }else {
            // 添加失败，说明 本类中已经有methodB
            // 只需要 把 methodA 的实现 替换成 methodB
            method_exchangeImplementations(methodA, methodB);
        }
    });
}

- (void)tempSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {

    if ([NSStringFromClass(self.class) isEqualToString:@"JWDIntervalButton"]) {
        self.timeInterval = self.timeInterval == 0 ? defaultInterval : self.timeInterval;
        if (self.isIgnoreEvent) {
            return;
        }else if (self.timeInterval > 0) {
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval inModes:@[NSRunLoopCommonModes,NSDefaultRunLoopMode]];
        }
    }

    self.isIgnoreEvent = YES;
    //此处 methodA和methodB方法IMP互换了，实际上执行 sendAction；所以不会死循环
    [self tempSendAction:action to:target forEvent:event];

}

// 不可点击
- (void)resetState {
    [self setIsIgnoreEvent:NO];
}

//runtime 动态绑定 属性
- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    // 注意BOOL类型 需要用OBJC_ASSOCIATION_RETAIN_NONATOMIC 不要用错，否则set方法会赋值出错
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval)timeInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
@end
