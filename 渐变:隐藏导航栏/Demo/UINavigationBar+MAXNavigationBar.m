//
//  UINavigationBar+MAXNavigationBar.m
//  Demo
//
//  Created by 汪文斌 on 2017/1/8.
//  Copyright © 2017年 Maximuum. All rights reserved.
//

#import "UINavigationBar+MAXNavigationBar.h"

@implementation UINavigationBar (MAXNavigationBar)

- (void)max_setNavigationBarOffsetY:(CGFloat)offset {
    self.transform = CGAffineTransformMakeTranslation(1, offset);
}

- (void)max_setContentViewAlpha:(CGFloat)alpha {
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = alpha;
    }];
    
    UIView *_titleView = [self valueForKey:@"_titleView"];
    _titleView.alpha = alpha;
    
    
    [[self subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIBarButtonItem class]]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

@end
