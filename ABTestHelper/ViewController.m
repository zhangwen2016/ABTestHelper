//
//  ViewController.m
//  ABTestHelper
//
//  Created by mosquitoo on 2020/2/4.
//  Copyright © 2020 Thea. All rights reserved.
//

#import "ViewController.h"
#import "RTTestHelper.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    self.titleLabel.text = @"hello";
    [RTTestHelper updateTestName:@"textColor" condition:@"b"];
    [self setUpABTest];
}

- (void)setUpABTest {
    [RTTestHelper abTestWithName:@"textColor" a:^{
        self.titleLabel.textColor = [UIColor redColor];
    } b:^{
        self.titleLabel.textColor = [UIColor blueColor];
    }];
}

- (void)initUI {
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
    }
    return _titleLabel;
}

@end
