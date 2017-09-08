//
//  UITextField+TextChange.m
//  Client
//
//  当 TextField 的输入内容发生改变时，调用委托方法
//
//  Created by qq on 2017/9/7.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "UITextField+TextChange.h"
#import <objc/runtime.h>

@implementation UITextField (TextChange)

@dynamic textChangeDelegate;

-(void)setTextChangeDelegate:(id<TextFieldChangeDelegate>) delegate{
    [self addTarget:self action:@selector(textChanged) forControlEvents:UIControlEventEditingChanged];
    objc_setAssociatedObject(self, @selector(textChangeDelegate), delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(id)textChangeDelegate{
    return objc_getAssociatedObject(self, @selector(textChangeDelegate));
}

-(void)textChanged{
    if(self.textChangeDelegate){
        [self.textChangeDelegate textFieldChanged:self];
    }
}
@end
