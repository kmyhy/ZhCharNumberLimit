//
//  UITextField+TextChange.h
//  Client
//  当 TextField 的输入内容发生改变时，调用委托方法

//  Created by qq on 2017/9/7.
//  Copyright © 2017年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>

// 重点在于这个委托协议，当 TextField 的输入内容改变，会调用这个协议中的方法
@protocol TextFieldChangeDelegate<NSObject>
- (void)textFieldChanged:(UITextField *)textField;
@end

@interface UITextField (TextChange)
@property(weak,nonatomic)id<TextFieldChangeDelegate> textChangeDelegate;

@end
