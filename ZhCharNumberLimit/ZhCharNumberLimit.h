//
//  ZhCharNumberLimit.h
//  Client
//
//  解决 TextField 中文字数限制的问题
//
//  Created by qq on 2017/9/7.
//  Copyright © 2017年 qq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITextField+TextChange.h"
#import "UITextView+TextChange.h"

@protocol ZhCharNumberLimitDelegate <NSObject>

-(void)exceedLimit:(int)charLimited;

@end

@interface ZhCharNumberLimit : NSObject<TextFieldChangeDelegate,TextViewChangeDelegate,UITextViewDelegate>
@property(nonatomic,assign)int charLimited;// 字符限制，中文非中文一样
@property(weak,nonatomic)id<ZhCharNumberLimitDelegate> delegate;

-(instancetype)initWithDelegate:(id<ZhCharNumberLimitDelegate>)delegate charLimited:(int)charLimited;
@end
