//
//  ZhCharNumberLimit.m
//  Client
//
//  Created by qq on 2017/9/7.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "ZhCharNumberLimit.h"

@implementation ZhCharNumberLimit

-(instancetype)initWithDelegate:(id<ZhCharNumberLimitDelegate>)delegate charLimited:(int)charLimited{
    self = [super init];
    self.delegate = delegate;
    self.charLimited = charLimited;
    return self;
}

- (void)textFieldChanged:(UITextField *)textField{
    NSString *toBeString = textField.text;
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    
    //下面的方法是iOS7被废弃的，注释
    //    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    
    if ([current.primaryLanguage isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > _charLimited) {
                textField.text = [toBeString substringToIndex:_charLimited];
                [_delegate exceedLimit:_charLimited];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > _charLimited) {
            textField.text = [toBeString substringToIndex:_charLimited];
            [_delegate exceedLimit:_charLimited];
        }
    }
    NSLog(@"%@",textField.text);
}
- (void)textViewChanged:(UITextView *)textView{
    NSString *toBeString = textView.text;
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    
    //下面的方法是iOS7被废弃的，注释
    //    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    
    if ([current.primaryLanguage isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > _charLimited) {
                textView.text = [toBeString substringToIndex:_charLimited];
                [_delegate exceedLimit:_charLimited];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > _charLimited) {
            textView.text = [toBeString substringToIndex:_charLimited];
            [_delegate exceedLimit:_charLimited];
        }
    }
    NSLog(@"%@",textView.text);
}
// kvo 导致内存泄漏
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    if([object isKindOfClass:[UITextView class]]){
//        [self textViewChanged:(UITextView*)object];
//    }
//}
// MARK: - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    [self textViewChanged:textView];
}

@end
