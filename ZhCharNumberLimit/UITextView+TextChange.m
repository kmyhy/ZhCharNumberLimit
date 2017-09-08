//
//  UITextView+TextChange.m
//  Client
//
//  Created by qq on 2017/9/7.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "UITextView+TextChange.h"
#import <objc/runtime.h>

@implementation UITextView (TextChange)

@dynamic textChangeDelegate;

-(void)setTextChangeDelegate:(id<TextViewChangeDelegate>) delegate{
    
    objc_setAssociatedObject(self, @selector(textChangeDelegate), delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 1 + 2
    
    // 1 的方法导致内存泄漏，先注释
    // 1. 这种方式仅能监听 textView.text = @"xxx" 这种改变，如果是键盘输入的不能监听,
//    [self addObserver:self.textChangeDelegate forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    // 2. 这种方式只能监听键盘输入，不能监听 textView.text=@"xxx" 的改变
    if([delegate conformsToProtocol:@protocol(UITextViewDelegate)]){
        self.delegate = (id<UITextViewDelegate>)delegate;
    }
}
-(id)textChangeDelegate{
    return objc_getAssociatedObject(self, @selector(textChangeDelegate));
}

// 删除 kvo
//-(void)dealloc{
//    if(self.textChangeDelegate){
//        [self removeObserver:self.textChangeDelegate forKeyPath:@"text"];
//        self.textChangeDelegate = nil;
//        self.delegate = nil;
//    }
//}
@end
