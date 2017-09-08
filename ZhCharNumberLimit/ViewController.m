//
//  ViewController.m
//  ZhCharNumberLimit
//
//  Created by qq on 2017/9/7.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "ViewController.h"
#import "ZhCharNumberLimit.h"
#import "MBProgressHUD+Add.h"

@interface ViewController ()<ZhCharNumberLimitDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ZhCharNumberLimit* limit = [[ZhCharNumberLimit alloc]initWithDelegate:self charLimited:10];
    
    _textView.textChangeDelegate = limit;
    
    _textField.textChangeDelegate = limit;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// MARK: - ZhCharNumberLimitDelegate
-(void)exceedLimit:(int)charLimited{
    NSString * string = [NSString stringWithFormat:@"节目名称不能超过%d字",charLimited];
    [MBProgressHUD showError:string toView:self.view];
}

@end
